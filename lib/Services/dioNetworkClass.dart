import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/Services/dio_execptions.dart';

import 'package:path_provider/path_provider.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(Dio());
});

class ApiService {
  final Dio _dioClient;

  ApiService(this._dioClient) {
    _dioClient.options = BaseOptions(
      baseUrl: "http://mybobby.acumobi.com",
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
      debugPrint("success====>$success");

      if (success) {
        return jsonResponse;
      } else {
        final String message = jsonResponse["message"] ?? "An Error Occurred!";
        debugPrint("message===response=>$message");
        return Future.error(message);
      }
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getRequest({required Map<String, dynamic> formData}) async {
    try {
      final response = await _dioClient.get(
        "/index.php",
      );
      final jsonResponse = jsonDecode(response.data);
      final success = jsonResponse["success"] == 1;
      debugPrint("Response---->$jsonResponse");
      debugPrint("success====>$success");

      if (success) {
        return jsonResponse;
      } else {
        final String message = jsonResponse['message'] ?? "An Error Occurred!";
        return Future.error(message);
      }
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getRequestWithQueryParam(
      {required Map<String, dynamic> formData}) async {
    try {
      final response = await _dioClient.get(
        "/index.php",
        queryParameters: formData,
      );
      final jsonResponse = jsonDecode(response.data);
      final success = jsonResponse["success"] == 1;
      debugPrint("Response---->$jsonResponse");
      debugPrint("success====>$success");

      if (success) {
        return jsonResponse;
      } else {
        final messages = jsonResponse["errors"] as List<dynamic>;
        final String message =
            messages.isNotEmpty ? messages.first : "An Error Occurred!";
        return Future.error(message);
      }
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> uploadDocuments(
      {required Map<String, dynamic> formData}) async {
    try {
      final response = await Dio().post("http://mybobby.acumobi.com/index.php",
          data: FormData.fromMap(formData));
      final jsonResponse = jsonDecode(response.data);
      final success = jsonResponse["success"] == 1;
      if (success) {
        return jsonResponse;
      } else {
        final String message = jsonResponse["message"] ?? "An Error Occured!";
        return Future.error(message);
      }
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }

  Future<File?> downloadFile(String filePath, String name) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      final file = File("${appStorage.path}/$name");

      if (file.existsSync()) {
        return file;
      }

      final Response response = await Dio().get(
        filePath,
        onReceiveProgress: (count, total) {},
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }
}

class GooglePlacesService {
  final Dio _dioPlaces = Dio();
  final String apiKey;

  GooglePlacesService(this.apiKey) {
    _dioPlaces.options = BaseOptions(
      baseUrl: "https://maps.googleapis.com/maps/api/place/autocomplete/json",
      responseType: ResponseType.json,
      connectTimeout: 18000,
      receiveTimeout: 18000,
      sendTimeout: 18000,
    );
    _dioPlaces.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<List<dynamic>> getRequest({
    required String input,
  }) async {
    try {
      final response = await _dioPlaces.get(
        "?input=$input&key=$apiKey",
      );
      final List<dynamic> jsonResponse = response.data['predictions'];
      final success = response.statusCode == 200;
      if (success) {
        return jsonResponse;
      } else {
        const String message = "An Error Occurred!";
        return Future.error(message);
      }
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }
}
