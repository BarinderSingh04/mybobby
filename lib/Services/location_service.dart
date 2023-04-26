import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService(Location());
});

class LocationService {
  final Location _location;

  LocationService(this._location);

  Future<LocationData> getLocation(PermissionStatus permissionStatus) async {
    try {
      switch (permissionStatus) {
        case PermissionStatus.granted:
        case PermissionStatus.grantedLimited:
          return await serviceEnabled();
        case PermissionStatus.denied:
          final permission = await _location.requestPermission();
          return await getLocation(permission);
        case PermissionStatus.deniedForever:
          return Future.error("DeniedForever");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<PermissionStatus> requestPermission() async {
    return await _location.requestPermission();
  }

  Future<PermissionStatus> getPermissionStatus() async {
    return await _location.hasPermission();
  }

  Stream<LocationData> getLocationStream() {
    return _location.onLocationChanged;
  }

  Future<bool> isbackgroundEnabled() async {
    return _location.isBackgroundModeEnabled();
  }

  Future<LocationData> serviceEnabled() async {
    final serviceEnabled = await _location.serviceEnabled();
    if (serviceEnabled) {
      try {
        return await _location.getLocation();
      } catch (e) {
        rethrow;
      }
    } else {
      final enabled = await _location.requestService();
      if (enabled) {
        return await _location.getLocation();
      } else {
        return Future.error("Service disabled");
      }
    }
  }
}
