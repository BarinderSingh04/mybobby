import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/direction_model.dart';

final directionServiceProvider = Provider<DirectionsServices>((ref) {
  return DirectionsServices(Dio(), "AIzaSyClf3Fdm00zQR4R2ssUjW-uZ9GC2ijYN2w");
});

class DirectionsServices {
  final String apiKey;
  final Dio _dio;

  DirectionsServices(
    this._dio,
    this.apiKey,
  ) {
    _dio.options = BaseOptions(
      baseUrl: "https://maps.googleapis.com/maps/api/",
    );
  }

  Future<Directions> getRouteCoordinates(
      LatLng origin, LatLng destination) async {
    try {
      final response = await _dio.get(
        "directions/json",
        queryParameters: {
          "origin": "${origin.latitude},${origin.longitude}",
          "destination": "${destination.latitude},${destination.longitude}",
          "key": apiKey,
        },
      );
      final values = response.data;

      List<dynamic> routes = values['routes'];
      if (routes.isEmpty) {
        return Directions(
          bounds: LatLngBounds(
            southwest: const LatLng(0, 0),
            northeast: const LatLng(0, 0),
          ),
          polylinePoints: [],
          totalDistance: "0",
          totalDuration: "0",
        );
      }
      return Directions.fromMap(values);
    } catch (e) {
      rethrow;
    }
  }
}
