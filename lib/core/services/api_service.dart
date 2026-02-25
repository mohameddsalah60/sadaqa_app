import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final options = Options(headers: {'lang': 'en'});

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({
    required String baseLink,
    required String endPoint,
    String? endPoint2,
    int? id,
    Options? headers,
  }) async {
    final Response<dynamic> response;
    if (endPoint2 != null) {
      if (id != null) {
        response = await dio.get(
          '$baseLink$endPoint$endPoint2$id',
          options: headers ?? options,
        );
      } else {
        response = await dio.get(
          '$baseLink$endPoint$endPoint2',
          options: headers ?? options,
        );
      }
    } else {
      response = await dio.get(
        '$baseLink$endPoint',
        options: headers ?? options,
      );
    }
    if (response.data is String) {
      return jsonDecode(response.data) as Map<String, dynamic>;
    }
    return response.data;
  }
}
