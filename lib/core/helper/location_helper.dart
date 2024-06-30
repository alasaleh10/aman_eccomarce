import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<bool> cheekLocationServess() async {
    var isServesEnable = await location.serviceEnabled();
    if (!isServesEnable) {
      isServesEnable = await location.requestService();
      if (!isServesEnable) {
        return false;
        // throw LocationServiceException();
      }
    }
    return true;
  }

  Future<bool> cheekLocationPermision() async {
    var permissionStats = await location.hasPermission();

    if (permissionStats == PermissionStatus.deniedForever) {
      return false;
    }

    if (permissionStats == PermissionStatus.denied) {
      permissionStats = await location.requestPermission();

      if (permissionStats != PermissionStatus.granted) {
        // throw LocationPermision();
        return false;
      }
    }
    return true;
  }

  // void getRialTimeLocations(void Function(LocationData) onData) async {
  //   await cheekLocationServess();
  //   await cheekLocationPermision();

  //   location.changeSettings(distanceFilter: 2);
  //   location.onLocationChanged.listen(onData);
  // }

  Future<LocationData> getLocation() async {
    await cheekLocationServess();
    await cheekLocationPermision();
    return location.getLocation();
  }
}

class LocationServiceException implements Exception {}

class LocationPermision implements Exception {}
