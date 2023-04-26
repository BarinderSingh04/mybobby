import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_detail.dart';
import 'dio_service.dart';
import 'local_storage_service.dart';

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

  Future<void> login(String phoneNumber) async {
    try {
      await _apiService.postRequest(
        formData: {
          "action": "start",
          "phone": phoneNumber,
          "type": "${UserType.driver.index + 1}",
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<UserDetail> verificationOtp(String phoneNumber, String otp) async {
    try {
      final jsonResponse = await _apiService.postRequest(
        formData: {
          "action": "login",
          "phone": phoneNumber,
          "otp": otp,
           "type": "${UserType.driver.index + 1}",
        },
      );
      final userJson = jsonResponse["result"];
      final userOtp = UserDetail.fromJson(userJson);
      _localStorageService.saveUserDetails(userOtp);
      return userOtp;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserDetail> updateUser(Map<String, dynamic> userMap) async {
    try {
      userMap["action"] = "profile";
      final jsonResponse = await _apiService.postRequest(formData: userMap);
      final getUserJson = jsonResponse["result"];
      final getUser = UserDetail.fromJson(getUserJson);
      _localStorageService.saveUserDetails(getUser);
      return getUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserDetail?> getUserDetail(String userId) async {
    try {
      final jsonResponse = await _apiService.postRequest(formData: {
        "action": "get-user",
        "id": userId,
      });
      final getUserJson = jsonResponse["result"];
      final getUser = UserDetail.fromJson(getUserJson);
      return getUser;
    } catch (e) {
      return null;
    }
  }
}
