import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/models/SaveRide.dart';
import 'package:mybobby/models/getUser.dart';
import 'package:shared_preferences/shared_preferences.dart';




final sharedPrefsProvider = Provider<SharedPreferences>(
      (ref) => throw UnimplementedError(),
);

final localStorageProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService(
    ref.watch(sharedPrefsProvider),
  );
});

class LocalStorageService {
  final SharedPreferences _preferences;

  LocalStorageService(this._preferences);

  /// getUser
  Future<void> saveUserDetails(GetUser user) async {
    await _preferences.setString("user", jsonEncode(user.toJson()));
  }

  GetUser? getUserDetails() {
    final json = _preferences.getString("user");
    return json != null ? GetUser.fromJson(jsonDecode(json)) : null;
  }

  /// SaveRide
  Future<void> saveRideDetails(SaveRide user) async {
    await _preferences.setString("saveRide", jsonEncode(user.toJson()));
  }

  SaveRide? getSaveRideDetails(){
    final json = _preferences.getString("saveRide");
    return json != null? SaveRide.fromJson(jsonDecode(json)) : null;

  }

  Future<void> clearSession() async {
    await _preferences.remove("user");

  }
}
