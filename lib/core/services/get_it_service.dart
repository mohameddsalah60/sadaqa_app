import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sadaqa_app/core/services/azkar_api_service.dart';
import 'package:sadaqa_app/core/services/geo_location_service.dart';
import 'package:sadaqa_app/core/services/islamic_api_service.dart';
import 'package:sadaqa_app/features/azkar/data/repos/azkar_repo_impl.dart';
import 'package:sadaqa_app/features/azkar/domin/repos/azkar_repo.dart';
import 'package:sadaqa_app/features/home/data/repos/prayer_repo_impl.dart';
import 'package:sadaqa_app/features/home/domin/repos/prayer_repo.dart';

import 'api_service.dart';
import 'location_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<IslamicApiService>(
    IslamicApiService(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<AzkarApiService>(
    AzkarApiService(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<AzkarRepo>(
    AzkarRepoImpl(azkarApiService: getIt<AzkarApiService>()),
  );
  getIt.registerSingleton<LocationService>(GeoLocationService());
  getIt.registerSingleton<PrayerRepo>(
    PrayerRepoImpl(
      islamicApiService: getIt<IslamicApiService>(),
      locationService: getIt<LocationService>(),
    ),
  );
}
