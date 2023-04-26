import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mybobby/models/autocomplete_state.dart';

final placeServiceProvider = Provider<PlaceService>((ref) {
  return PlaceService(Dio(), "AIzaSyClf3Fdm00zQR4R2ssUjW-uZ9GC2ijYN2w");
});

class PlaceService {
  final String apiKey;
  final Dio _dio;

  PlaceService(
    this._dio,
    this.apiKey,
  ) {
    _dio.options = BaseOptions(
      responseType: ResponseType.json,
      baseUrl: "https://maps.googleapis.com/maps/api/",
    );
  }

  Future<PlaceModel> getPlaceModel(LatLng location) async {
    try {
      final response = await _dio.get(
        "geocode/json",
        queryParameters: {
          "latlng": "${location.latitude},${location.longitude}",
          "key": apiKey,
        },
      );
      final jsonResponse = response.data;
      final List<dynamic> results = jsonResponse["results"];
      if (results.isNotEmpty) {
        return PlaceModel(
          id: results[0]["place_id"],
          name: results[0]["formatted_address"],
          location: LatLng(
            results[0]["geometry"]["location"]["lat"],
            results[0]["geometry"]["location"]["lng"],
          ),
        );
      } else {
        return Future.error("Unable to get location id");
      }
    } catch (e) {
      rethrow;
    }
  }
}
