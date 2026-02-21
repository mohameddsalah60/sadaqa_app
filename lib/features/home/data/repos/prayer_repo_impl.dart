import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';

import 'package:sadaqa_app/core/errors/failures.dart';
import 'package:sadaqa_app/core/services/islamic_api_service.dart';
import 'package:sadaqa_app/core/services/location_service.dart';

import 'package:sadaqa_app/features/home/domin/entites/preyer_entity.dart';

import '../../domin/repos/prayer_repo.dart';
import '../models/prayer_models.dart';

class PrayerRepoImpl extends PrayerRepo {
  final IslamicApiService islamicApiService;
  final LocationService locationService;
  PrayerRepoImpl({
    required this.locationService,
    required this.islamicApiService,
  });
  @override
  Future<Either<Failure, List<PreyerEntity>>> getPrayerTimes({
    required UserLocation location,
  }) async {
    try {
      final data = await islamicApiService.getPrayerTimes(
        lat: location.latitude.toString(),
        long: location.longitude.toString(),
      );
      final prayers = PrayerModels.fromJson(data);
      return Right(prayers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserLocation>> getCurrunetLocation() async {
    try {
      final checkPermission = await locationService.checkLocationPermission();
      if (checkPermission) {
        final location = await locationService.getCurrentPosition();
        return Right(location);
      } else {
        return Left(PermissionFailure('Location permission denied'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<List<Placemark>> getPlacemarksFromCoordinates({
    required UserLocation userLocation,
  }) async {
    try {
      final placemarks = await locationService.getPlacemarksFromCoordinates(
        userLocation: userLocation,
      );
      return placemarks;
    } catch (e) {
      throw Exception('Failed to get placemarks: $e');
    }
  }
}
