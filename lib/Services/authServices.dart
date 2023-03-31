import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/Services/dioNetworkClass.dart';
import 'package:mybobby/Services/local_storage_service.dart';
import 'package:mybobby/models/SaveRide.dart';

import 'package:mybobby/models/getUser.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.watch(apiServiceProvider),
    ref.watch(localStorageProvider),
  );
});

class AuthService {
  final ApiService _apiService;
  final LocalStorageService _localStorageService;

  AuthService(this._apiService, this._localStorageService);

  /// UserLogin
  Future<void> userLogin(String phoneNumber) async {
    try {
      await _apiService.postRequest(
        formData: {
          "action": "start",
          "phone": phoneNumber,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  /// OtpVerification
  Future<GetUser> verificationOtp(String phoneNumber, String otp) async {
    try {
      final jsonResponse = await _apiService.postRequest(
        formData: {"action": "login", "phone": phoneNumber, "otp": otp},
      );
      final userJson = jsonResponse["result"];
      final userOtp = GetUser.fromJson(userJson);
      _localStorageService.saveUserDetails(userOtp);
      return userOtp;
    } catch (e) {
      rethrow;
    }
  }

  /// getUser
  Future<GetUser> getUser(String id) async {
    try {
      final jsonResponse = await _apiService.postRequest(
        formData: {"action": "get-user", "id": id},
      );
      final getUserJson = jsonResponse["result"];
      final getUser = GetUser.fromJson(getUserJson);
      return getUser;
    } catch (e) {
      rethrow;
    }
  }

  /// UpdateUser
  Future<GetUser> updateUser(Map<String, dynamic> userMap) async {
    try {
      userMap["action"] = "profile";
      final jsonResponse = await _apiService.postRequest(formData: userMap);
      final getUserJson = jsonResponse["result"];
      final getUser = GetUser.fromJson(getUserJson);
      _localStorageService.saveUserDetails(getUser);
      return getUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<SaveRide> confirmTrip(String id, double lat, double lng) async {
    try {
      final jsonResponse = await _apiService.postRequest(formData: {
        'action': "save-booking",
        'customer_id': id,
        'start': lat,
        "end": lng,
        "status": "1",
      });

      final saveRideJson = jsonResponse['result'];
      final saveRide = SaveRide.fromJson(saveRideJson);
      _localStorageService.saveRideDetails(saveRide);
      return saveRide;
    } catch (e) {
      rethrow;
    }
  }
}
