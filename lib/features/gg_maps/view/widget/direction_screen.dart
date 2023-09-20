// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:od/features/gg_maps/cubit/google_map_cubit.dart';

import '../../../../api_key.dart';

class DirectionsScreen extends StatefulWidget {
  const DirectionsScreen({Key? key}) : super(key: key);

  @override
  State<DirectionsScreen> createState() => DirectionsState();
}

class DirectionsState extends State<DirectionsScreen> {
  List<String> _searchResults1 = [];
  List<String> _searchResults2 = [];
  List listOfPoints = [];
  List<LatLng> points = const <LatLng>[];
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late GoogleMapController _googleMapController;
  String? distance;
  String? duration;
  String? routeName;

  List<LatLng> polygonLatLng = [];
  final Set<Marker> _makers = <Marker>{};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.0875565, 105.8001873),
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            setState(() {
                              _searchResults1 = [];
                            });
                          },
                          onChanged: (value) async {
                            final results = await context
                                .read<GoogleMapCubit>()
                                .autoComplete(value);
                            setState(() {
                              _searchResults1 = results;
                            });
                          },
                          controller:
                              context.read<GoogleMapCubit>().startController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              hintText: 'Start',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            setState(() {
                              _searchResults2 = [];
                            });
                          },
                          onChanged: (value) async {
                            final results = await context
                                .read<GoogleMapCubit>()
                                .autoComplete(value);
                            setState(() {
                              _searchResults2 = results;
                            });
                          },
                          controller:
                              context.read<GoogleMapCubit>().endController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              hintText: 'End',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      var place1 = await context
                          .read<GoogleMapCubit>()
                          .getLatLng(context
                              .read<GoogleMapCubit>()
                              .startController
                              .text);

                      var place2 = await context
                          .read<GoogleMapCubit>()
                          .getLatLng(context
                              .read<GoogleMapCubit>()
                              .endController
                              .text);

                      var name1 = await context.read<GoogleMapCubit>().getName(
                          context.read<GoogleMapCubit>().startController.text,
                          routeName ?? '');
                      var name2 = await context.read<GoogleMapCubit>().getName(
                          context.read<GoogleMapCubit>().endController.text,
                          routeName ?? '');
                      getDirections(place1['lat'], place1['lng'], place2['lat'],
                          place2['lng']);
                      _makers.add(Marker(
                        markerId: const MarkerId('start'),
                        infoWindow: InfoWindow(
                          title: name1,
                        ),
                        icon: BitmapDescriptor.defaultMarker,
                        position: LatLng(place1['lat'], place1['lng']),
                      ));
                      _makers.add(Marker(
                        markerId: const MarkerId('end'),
                        infoWindow: InfoWindow(
                          title: name2,
                        ),
                        icon: BitmapDescriptor.defaultMarker,
                        position: LatLng(place2['lat'], place2['lng']),
                      ));
                      _googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                              target: LatLng(place1['lat'], place1['lng']),
                              zoom: 20)));

                      setState(() {});
                    },
                    icon: const Icon(Icons.search)),
              ],
            ),
            context.read<GoogleMapCubit>().startController.text.isNotEmpty
                ? _searchResults1.isEmpty
                    ? Container()
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: context
                                    .read<GoogleMapCubit>()
                                    .startController
                                    .text
                                    .isEmpty
                                ? 0
                                : _searchResults1.length,
                            itemBuilder: (context, index) {
                              final result = _searchResults1[index];
                              return ListTile(
                                onTap: () async {
                                  context
                                      .read<GoogleMapCubit>()
                                      .startController
                                      .text = result;
                                },
                                title: Text(result),
                              );
                            }),
                      )
                : Container(),
            context.read<GoogleMapCubit>().endController.text.isNotEmpty
                ? _searchResults2.isEmpty
                    ? Container()
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: context
                                    .read<GoogleMapCubit>()
                                    .endController
                                    .text
                                    .isEmpty
                                ? 0
                                : _searchResults2.length,
                            itemBuilder: (context, index) {
                              final result = _searchResults2[index];
                              return ListTile(
                                onTap: () async {
                                  context
                                      .read<GoogleMapCubit>()
                                      .endController
                                      .text = result;
                                },
                                title: Text(result),
                              );
                            }),
                      )
                : Container(),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap(
                    polylines: {
                      Polyline(
                          consumeTapEvents: true,
                          color: Colors.red,
                          polylineId: const PolylineId('_kPolyline'),
                          points: points,
                          width: 3)
                    },
                    mapType: MapType.normal,
                    markers: _makers,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _googleMapController = controller;
                      _controller.complete(controller);
                    },
                  ),
                  duration != null && distance != null
                      ? Positioned(
                          top: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                                'Distance: $distance km\n Duration: $duration min'),
                          ))
                      : Container(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  getDirections(
      double startLat, double startLng, double endLat, double endLng) async {
    String url =
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$openroute_api_key&start=$startLng,$startLat&end=$endLng,$endLat';
    var res = await http.get(Uri.parse(url));
    setState(() {
      var json = jsonDecode(res.body);
      listOfPoints = json['features'][0]['geometry']['coordinates'];
      points = listOfPoints
          .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
          .toList();
      distance =
          (json['features'][0]['properties']['summary']['distance'] / 1000)
              .toStringAsFixed(2);

      duration = (json['features'][0]['properties']['summary']['duration'] / 60)
          .toStringAsFixed(0);
    });
  }
}
