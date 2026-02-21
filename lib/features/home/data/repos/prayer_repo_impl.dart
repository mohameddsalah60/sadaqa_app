import 'package:dartz/dartz.dart';

import 'package:sadaqa_app/core/errors/failures.dart';
import 'package:sadaqa_app/core/services/islamic_api_service.dart';

import 'package:sadaqa_app/features/home/domin/entites/preyer_entity.dart';

import '../../domin/repos/prayer_repo.dart';
import '../models/prayer_models.dart';

class PrayerRepoImpl extends PrayerRepo {
  final IslamicApiService islamicApiService;

  PrayerRepoImpl({required this.islamicApiService});
  @override
  Future<Either<Failure, List<PreyerEntity>>> getPrayerTimes() async {
    try {
      final data = await islamicApiService.getPrayerTimes(
        lat: '31.25711108036706',
        long: '32.2896648434458',
      );
      final prayers = PrayerModels.fromJson(data);
      return Right(prayers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
