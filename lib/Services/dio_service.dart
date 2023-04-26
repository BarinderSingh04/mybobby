import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/services/dio_execptions.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(Dio());
});

class ApiService {
  final Dio _dioClient;

  ApiService(this._dioClient) {
    _dioClient.options = BaseOptions(
      baseUrl: "http://mybobby.acumobi.com/index.php",
      responseType: ResponseType.json,
      connectTimeout: 18000,
      receiveTimeout: 18000,
      sendTimeout: 18000,
    );
    _dioClient.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<dynamic> postRequest({required Map<String, dynamic> formData}) async {
    try {
      final response = await _dioClient.post(
        "/index.php",
        data: FormData.fromMap(formData),
      );
      final jsonResponse = jsonDecode(response.data);
      final success = jsonResponse["success"] == 1;
      if (success) {
        return jsonResponse;
      } else {
        final String message = jsonResponse["message"] ?? "An Error Occurred!";
        return Future.error(message);
      }
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }
}
