import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sadaqa_app/core/errors/failures.dart';
import 'package:sadaqa_app/core/services/location_service.dart';
import 'package:sadaqa_app/features/home/domin/entites/preyer_entity.dart';

abstract class PrayerRepo {
  Future<Either<Failure, UserLocation>> getCurrunetLocation();
  Future<List<Placemark>> getPlacemarksFromCoordinates({
    required UserLocation userLocation,
  });
  Future<Either<Failure, List<PreyerEntity>>> getPrayerTimes({
    required UserLocation location,
  });
}
