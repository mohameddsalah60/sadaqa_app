import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../errors/exceptions.dart';
import 'location_service.dart';

class GeoLocationService implements LocationService {
  @override
  Future<bool> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw CustomException(
          message: 'تم رفض إذن الموقع. من فضلك اسمح بالوصول علشان نكمّل.',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw CustomException(
        message:
            'تم رفض إذن الموقع بشكل دائم. من فضلك فعّل الإذن من إعدادات التطبيق.',
      );
    }

    return true;
  }

  @override
  Future<UserLocation> getCurrentPosition() async {
    final hasPermission = await checkLocationPermission();

    if (!hasPermission) {
      throw CustomException(
        message:
            'نحتاج إلى موقعك لجلب مواعيد الصلوات. من فضلك فعّل صلاحيات الموقع.',
      );
    }

    try {
      final position = await Geolocator.getCurrentPosition();
      return UserLocation(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      throw CustomException(message: 'تعذّر الحصول على موقعك. حاول مرة أخرى.');
    }
  }

  @override
  Future<List<Placemark>> getPlacemarksFromCoordinates({
    required UserLocation userLocation,
  }) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        userLocation.latitude,
        userLocation.longitude,
      );
      return placemarks;
    } catch (e) {
      throw CustomException(message: 'تعذّر الحصول على العنوان من الموقع.');
    }
  }
}
