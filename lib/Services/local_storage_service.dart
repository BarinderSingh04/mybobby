import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/models/autocomplete_state.dart';
import 'package:mybobby/models/user_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ride.dart';

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

  Future<void> saveUserDetails(UserDetail user) async {
    await _preferences.setString("user", jsonEncode(user.toJson()));
  }

  UserDetail? getUserDetails() {
    final json = _preferences.getString("user");
    return json != null ? UserDetail.fromJson(jsonDecode(json)) : null;
  }

  Future<void> clearSession() async {
    await _preferences.remove("user");
    await _preferences.remove("recents");
    await _preferences.remove("ride");
  }

  Future<void> saveRide(Ride ride) async {
    await _preferences.setString("ride", ride.id);
  }

  String? getRideId() {
    return _preferences.getString("ride");
  }

  List<PlaceModel>? recentSelection() {
    return _preferences
        .getStringList("recents")
        ?.map((e) => PlaceModel.fromJson(jsonDecode(e)))
        .toList();
  }

  Future<void> saveRecentDestinationSelection(PlaceModel placeModel) async {
    final recents = recentSelection();
    if (recents != null) {
      if (!recents.map((e) => e.name).contains(placeModel.name)) {
        recents.add(placeModel);
        await _preferences.setStringList(
            "recents", recents.map((e) => jsonEncode(e.toJson())).toList());
      }
    } else {
      await _preferences
          .setStringList("recents", [jsonEncode(placeModel.toJson())]);
    }
  }
}
