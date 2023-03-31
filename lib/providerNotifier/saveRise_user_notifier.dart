
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/Services/authServices.dart';
import 'package:mybobby/models/SaveRide.dart';

final saveRideNotifierProvider =
StateNotifierProvider.autoDispose<GetUserNotifier, AsyncValue<SaveRide?>>(
        (ref) {
      return GetUserNotifier(ref.watch(authServiceProvider));
    });



class GetUserNotifier extends StateNotifier<AsyncValue<SaveRide?>> {
  final AuthService _authService;
  final Map<String, dynamic> _formData = {};

  GetUserNotifier(this._authService) : super(const AsyncValue.data(null));

  Future<void> saveRideUser(String id,double lat,double lng) async {
    try {
      state = const AsyncValue.loading();
      /*final String id = _formData['customer_id'];
      final double lat = _formData['start'];
      final double lng = _formData['end'];*/
      final getProfile = await _authService.confirmTrip(id,lat,lng);
      state =  AsyncValue.data(getProfile);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  void updateFormData(String key, String? value) {
    _formData[key] = value!.trim();
  }
}