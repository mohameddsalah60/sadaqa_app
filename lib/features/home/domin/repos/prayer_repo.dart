import 'package:dartz/dartz.dart';
import 'package:sadaqa_app/core/errors/failures.dart';
import 'package:sadaqa_app/features/home/domin/entites/preyer_entity.dart';

abstract class PrayerRepo {
  Future<Either<Failure, List<PreyerEntity>>> getPrayerTimes();
}
