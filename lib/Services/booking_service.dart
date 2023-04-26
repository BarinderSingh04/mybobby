import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/autocomplete_state.dart';
import '../models/ride.dart';
import 'dio_service.dart';

final bookServiceProvider = Provider<BookingService>((ref) {
  return BookingService(ref.watch(apiServiceProvider));
});

class BookingService {
  final ApiService _apiService;

  BookingService(this._apiService);

  Future<RideDTO> bookRide(
    String customerId,
    PlaceModel start,
    PlaceModel end,
    RideStatus status,
  ) async {
    try {
      final response = await _apiService.postRequest(
        formData: {
          "action": "save-booking",
          "start_place_id": start.id,
          "start_address": start.name,
          "start_lat": start.location!.latitude,
          "start_long": start.location!.longitude,
          "end_place_id": end.id,
          "end_address": end.name,
          "end_lat": end.location!.latitude,
          "end_long": end.location!.longitude,
          "customer_id": customerId,
          "status": status.index + 1
        },
      );
      final jsonResponse = response["result"];
      return RideDTO.fromJson(jsonResponse);
    } catch (e) {
      rethrow;
    }
  }

  Future<RideDTO> acceptRide(
    String rideId,
    RideStatus status,
    String driverId,
  ) async {
    try {
      final response = await _apiService.postRequest(
        formData: {
          "action": "save-booking",
          "id": rideId,
          "status": "${status.index + 1}",
          "helper_id": driverId
        },
      );
      final jsonResponse = response["result"];
      return RideDTO.fromJson(jsonResponse);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RideDTO>> getRides({RideStatus? status}) async {
    try {
      final response = await _apiService.postRequest(
        formData: {
          "action": "get-bookings",
          "status": status != null ? "${status.index + 1}" : null,
        },
      );
      final List<dynamic> jsonResponse = response["result"];
      return jsonResponse.map((e) => RideDTO.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RideDTO>> getCompletedRides() async {
    try {
      final response = await _apiService.postRequest(
        formData: {
          "action": "get-bookings",
          "status": "${RideStatus.completed.index + 1}",
        },
      );
      final List<dynamic> jsonResponse = response["result"];
      return jsonResponse.map((e) => RideDTO.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
