// core/services/azkar_api_service.dart
import 'dart:developer';
import 'package:sadaqa_app/core/services/api_service.dart';

class AzkarApiService {
  final ApiService apiService;

  AzkarApiService({required this.apiService});

  Future<dynamic> getAzkar() async {
    try {
      var data = await apiService.get(
        baseLink:
            'https://raw.githubusercontent.com/mohameddsalah60/azkar-api/refs/heads/main/',
        endPoint: 'azkar.json',
      );

      log('✅ تم جلب الأذكار بنجاح');
      return data;
    } catch (e) {
      log('❌ خطأ في جلب الأذكار: $e');
      rethrow;
    }
  }
}
