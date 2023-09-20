import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:od/features/gg_maps/cubit/google_map_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/SearchScreen';

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late GoogleMapController _googleMapController;
  List<String> _searchResults = [];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.0875565, 105.8001873),
    zoom: 16,
  );

  currentLocation() async {
    Position position =
        await context.read<GoogleMapCubit>().determinePosition();
    _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 20)));
  }

  @override
  void initState() {
    currentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      setState(() {
                        _searchResults = [];
                      });
                    },
                    onChanged: (value) async {
                      final results = await context
                          .read<GoogleMapCubit>()
                          .autoComplete(value);
                      setState(() {
                        _searchResults = results;
                      });
                    },
                    controller: context.read<GoogleMapCubit>().searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      hintText: 'Search Place',
                      suffixIcon: IconButton(
                          onPressed: () async {
                            context.read<GoogleMapCubit>().getPlace(
                                context
                                    .read<GoogleMapCubit>()
                                    .searchController
                                    .text,
                                _googleMapController);
                          },
                          icon: const Icon(Icons.search)),
                    ),
                  ),
                ),
                context.read<GoogleMapCubit>().searchController.text.isNotEmpty
                    ? _searchResults.isEmpty
                        ? Container()
                        : Flexible(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: context
                                        .read<GoogleMapCubit>()
                                        .searchController
                                        .text
                                        .isEmpty
                                    ? 0
                                    : _searchResults.length,
                                itemBuilder: (context, index) {
                                  final result = _searchResults[index];
                                  return ListTile(
                                    onTap: () async {
                                      context
                                          .read<GoogleMapCubit>()
                                          .searchController
                                          .text = result;

                                      // ignore: use_build_context_synchronously
                                    },
                                    title: Text(result),
                                  );
                                }),
                          )
                    : Container(),
                Expanded(
                  child: GoogleMap(
                    onTap: ((argument) {}),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    markers: state.makers,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      _googleMapController = controller;
                    },
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 100,
                right: 10,
                child: GestureDetector(
                  onTap: () async {
                    Position position = await context
                        .read<GoogleMapCubit>()
                        .determinePosition();

                    _googleMapController.animateCamera(
                        CameraUpdate.newCameraPosition(CameraPosition(
                            target:
                                LatLng(position.latitude, position.longitude),
                            zoom: 20)));
                    setState(() {});
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      height: 50,
                      width: 50,
                      child: const Icon(
                        Icons.my_location,
                        size: 40,
                        color: Colors.blue,
                      )),
                )),
            Positioned(
                bottom: 100,
                right: 10,
                child: GestureDetector(
                  onTap: () async {
                    Position position = await context
                        .read<GoogleMapCubit>()
                        .determinePosition();

                    _googleMapController.animateCamera(
                        CameraUpdate.newCameraPosition(CameraPosition(
                            target:
                                LatLng(position.latitude, position.longitude),
                            zoom: 20)));
                    setState(() {});
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      height: 50,
                      width: 50,
                      child: const Icon(
                        Icons.my_location,
                        size: 40,
                        color: Colors.blue,
                      )),
                ))
          ],
        );
      },
    );
  }
}
