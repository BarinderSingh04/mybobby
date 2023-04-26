import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/models/autocomplete_state.dart';

import '../models/ride.dart';
import '../models/user_detail.dart';
import '../services/auth_services.dart';
import '../services/booking_service.dart';

final rideRepositoryProvider = Provider<RideRepository>((ref) {
  return RideRepository(
    ref.watch(bookServiceProvider),
    ref.watch(authServiceProvider),
  );
});

class RideRepository {
  final BookingService _bookingService;
  final AuthService _authService;

  RideRepository(this._bookingService, this._authService);

  Future<Ride> acceptRide(String rideId, String driverId) async {
    try {
      final RideDTO rideDTO = await _bookingService.acceptRide(
        rideId,
        RideStatus.accepted,
        driverId,
      );
      final List<UserDetail?> users = await Future.wait([
        _authService.getUserDetail(rideDTO.customerId),
        _authService.getUserDetail(rideDTO.helperId!),
      ]);
      return rideDTO.toRide(users.firstOrNull, users.lastOrNull);
    } catch (e) {
      rethrow;
    }
  }

  Future<Ride?> activeRide(String rideId) async {
    try {
      final rideList = await _bookingService.getRides();
      final rideDTO = rideList.firstWhereOrNull((r) => r.id == rideId);
      if (rideDTO == null) {
        return null;
      }
      if (rideDTO.helperId == null) {
        final customer = await _authService.getUserDetail(rideDTO.customerId);
        return rideDTO.toRide(customer, null);
      } else {
        final List<UserDetail?> users = await Future.wait([
          _authService.getUserDetail(rideDTO.customerId),
          _authService.getUserDetail(rideDTO.helperId!),
        ]);
        return rideDTO.toRide(users.firstOrNull, users.lastOrNull);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Ride> bookRide(
    String customerId,
    PlaceModel start,
    PlaceModel end,
    RideStatus status,
  ) async {
    try {
      final RideDTO rideDTO =
          await _bookingService.bookRide(customerId, start, end, status);

      if (rideDTO.helperId == null) {
        final customer = await _authService.getUserDetail(rideDTO.customerId);
        return rideDTO.toRide(customer, null);
      } else {
        final List<UserDetail?> users = await Future.wait([
          _authService.getUserDetail(rideDTO.customerId),
          _authService.getUserDetail(rideDTO.helperId!),
        ]);
        return rideDTO.toRide(users.firstOrNull, users.lastOrNull);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Ride>> getRideList(String userId) async {
    try {
      final rideList =
          await _bookingService.getRides(status: RideStatus.created);
      final filteredList = rideList.where((e) => e.customerId == userId);
      final customerList =
          filteredList.map((e) => e.customerId).toSet().toList();
          
      final List<UserDetail?> customers = await Future.wait(
        List.generate(
          customerList.length,
          (index) => _authService.getUserDetail(customerList[index]),
        ),
      );

      return filteredList
          .map(
            (rideDto) {
              final customer = customers
                  .singleWhereOrNull((c) => c?.id == rideDto.customerId);
              return rideDto.toRide(
                customer,
                null,
              );
            },
          )
          .where((r) => r.customer != null)
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Ride>> getCompletedRideList(String driverId) async {
    try {
      final rideList = await _bookingService.getCompletedRides();
      final filteredList =
          rideList.where((r) => r.helperId == driverId).toList();
      final customerList =
          filteredList.map((e) => e.customerId).toSet().toList();
      final List<UserDetail?> customers = await Future.wait(
        List.generate(
          customerList.length,
          (index) => _authService.getUserDetail(customerList[index]),
        ),
      );

      return filteredList
          .map(
            (rideDto) => rideDto.toRide(
              customers.singleWhereOrNull((c) => c?.id == rideDto.customerId),
              null,
            ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
