import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:od/api_key.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  GoogleMapCubit() : super(const GoogleMapState());
  late String name;

  getPlace(String value, GoogleMapController googleMapController) async {
    String url =
        'https://api.openrouteservice.org/geocode/search?api_key=$openroute_api_key&text=$value';
    var res = await http.post(Uri.parse(url));
    var json = jsonDecode(res.body);
    final feature = json['features'][0];
    final coordinates = feature['geometry']['coordinates'] as List<dynamic>;
    final position = LatLng(coordinates[1], coordinates[0]);
    name = json['features'][0]['properties']['label'];

    final Set<Marker> makers = {};
    makers.clear();
    makers.add(Marker(
        markerId: const MarkerId('id'),
        position: position,
        infoWindow: InfoWindow(title: name)));

    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 20)));
    emit(state.copyWith(makers: makers));
  }

  currentLocation() async {
    final Set<Marker> makers = {};
    makers.addAll(state.makers);
    makers.clear();
    emit(state.copyWith(makers: makers));
  }

  autoComplete(String value) async {
    String url =
        'https://api.openrouteservice.org/geocode/autocomplete?api_key=$openroute_api_key&text=$value';
    var res = await http.get(Uri.parse(url));
    var json = jsonDecode(res.body);
    final features = json['features'] as List<dynamic>;
    final results = features
        .map((feature) => feature['properties']['label'] as String)
        .toList();
    return results;
  }

  getLatLng(String value) async {
    String url =
        'https://api.openrouteservice.org/geocode/search?api_key=$openroute_api_key&text=$value';
    var res = await http.post(Uri.parse(url));
    var json = jsonDecode(res.body);
    double lat = json['features'][0]['geometry']['coordinates'][1];
    double lng = json['features'][0]['geometry']['coordinates'][0];

    return {'lat': lat, 'lng': lng};
  }

  getName(String value, String routeName) async {
    String url =
        'https://api.openrouteservice.org/geocode/search?api_key=$openroute_api_key&text=$value';
    var res = await http.post(Uri.parse(url));
    var json = jsonDecode(res.body);
    routeName = json['features'][0]['properties']['label'];

    return routeName;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
