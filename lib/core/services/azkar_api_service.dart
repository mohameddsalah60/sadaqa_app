import 'api_service.dart';

class AzkarApiService {
  final ApiService apiService;

  AzkarApiService({required this.apiService});
  Future<Map<String, dynamic>> getAzkar() async {
    try {
      var data = await apiService.get(
        baseLink: 'https://salah.aknan.org/api/',
        endPoint: 'azkar',
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
