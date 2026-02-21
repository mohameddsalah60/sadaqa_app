import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final String _baseLink = 'https://islamicapi.com/api/v1/';
  final Dio dio;
  final options = Options(headers: {'lang': 'en'});

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({
    required String endPoint,
    String? endPoint2,
    int? id,
    Options? headers,
  }) async {
    final Response<dynamic> response;
    if (endPoint2 != null) {
      if (id != null) {
        response = await dio.get(
          '$_baseLink$endPoint$endPoint2$id',
          options: headers ?? options,
        );
      } else {
        response = await dio.get(
          '$_baseLink$endPoint$endPoint2',
          options: headers ?? options,
        );
      }
    } else {
      response = await dio.get(
        '$_baseLink$endPoint',
        options: headers ?? options,
      );
    }
    log("API RESPONSE: ${response.data}");
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Options? headers,
    Object? data,
  }) async {
    final response = await dio.post(
      '$_baseLink$endPoint',
      data: data,
      options: headers ?? options,
    );

    final responseData = response.data;

    return responseData;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    Options? headers,
    Object? data,
  }) async {
    final response = await dio.put(
      '$_baseLink$endPoint',
      data: data,
      options: headers ?? options,
    );

    final responseData = response.data;

    return responseData;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Options? headers,
    Object? data,
  }) async {
    final response = await dio.delete(
      '$_baseLink$endPoint',
      data: data,
      options: headers ?? options,
    );

    final responseData = response.data;

    return responseData;
  }

  Stream<Map<String, dynamic>> getStream({
    required String endPoint,
    Options? headers,
  }) async* {
    final Response<dynamic> response;

    response = await dio.get(
      '$_baseLink$endPoint',
      options: headers ?? options,
    );
    yield response.data;
  }
}
