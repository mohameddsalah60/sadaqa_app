import 'package:sadaqa_app/core/services/api_service.dart';

class IslamicApiService {
  final ApiService apiService;

  IslamicApiService({required this.apiService});
  Future<Map<String, dynamic>> getPrayerTimes({
    required String lat,
    required String long,
  }) async {
    try {
      var data = await apiService.get(
        baseLink: 'https://islamicapi.com/api/v1/',
        endPoint:
            'prayer-time/?lat=$lat&lon=$long&method=5&api_key=WEca8Cx0ip44m6kqLGCJFW96Qp48Y6JUoHIosj3lgC91B4sw',
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
