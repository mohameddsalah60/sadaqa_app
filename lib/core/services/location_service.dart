import 'package:geocoding/geocoding.dart';

abstract class LocationService {
  Future<bool> checkLocationPermission();
  Future<UserLocation> getCurrentPosition();
  Future<List<Placemark>> getPlacemarksFromCoordinates({
    required UserLocation userLocation,
  });
}

class UserLocation {
  final double latitude, longitude;

  UserLocation({required this.latitude, required this.longitude});
}
