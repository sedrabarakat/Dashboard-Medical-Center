import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/utils/app_url.dart';

import 'api_service.dart';

class ApiServicesImp implements ApiServices {
  final Dio _dio;
  late Map<String, dynamic> _headers;

  ApiServicesImp(this._dio) {
    _dio.options
      ..baseUrl = baseUrl
      ..responseType = ResponseType.plain
      ..sendTimeout = const Duration(minutes: 1)
      ..receiveTimeout = const Duration(minutes: 1)
      ..connectTimeout = const Duration(seconds: 10)
      ..followRedirects = true;
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  Future<void> setHeaders(bool hasToken) async {
    _headers = {
      "Accept": "application/json",

      "accept-timezone": DateTime.now().timeZoneName,
      // Todo handle the token
      // "Authorization":
      //     hasToken ? "Bearer ${( AppStorage.instance.readData(AppStorage.TOKEN))}" : null,
    };
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      bool? hasToken}) async {
    try {
      await setHeaders(hasToken ?? true);
      final response = await _dio.delete(
        path,
        queryParameters: queryParams,
        data: body,
        options: Options(headers: _headers),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future get(String path,
      {Map<String, String>? queryParams, bool? hasToken}) async {
    try {
      await setHeaders(hasToken ?? true);
      final response = await _dio.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: _headers),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      FormData? formData,
      bool? hasToken}) async {
    try {
      await setHeaders(hasToken ?? true);

      final response = await _dio.post(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options:
            Options(headers: _headers, contentType: Headers.jsonContentType),
      );

      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future postFiles(BuildContext context, String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      String? key,
      FormData? formData,
      bool? hasToken}) async {
    try {
      await setHeaders(hasToken ?? true);

      final response = await _dio.post(path,
          queryParameters: queryParams,
          data: formData ?? body,
          options:
              Options(headers: _headers, contentType: Headers.jsonContentType),
          onSendProgress: (sent, total) {
        if (total != -1) {
          var progress = (sent / total * 100).toStringAsFixed(0);
          //Todo handle the progress ui
          // BlocProvider.of<UploadManagerCubit>(context)
          //     .uploadFile(key: key, progress: progress);
        }
      }, onReceiveProgress: (sent, total) {
        if (total != -1) {
          var progress = (sent / total * 100).toStringAsFixed(0);
          print('Download progress: $progress%');
        }
      });
      // BlocProvider.of<UploadManagerCubit>(context).completeUploadFile(key: key);
      return _handleResponseAsJson(response);
    } catch (error) {
      // BlocProvider.of<UploadManagerCubit>(context).failureUploadFile(key: key);
      rethrow;
    }
  }

  @override
  Future postList(String path,
      {Map<String, String>? queryParams,
      List? body,
      FormData? formData,
      bool? hasToken}) async {
    try {
      setHeaders(hasToken ?? true);
      final response = await _dio.post(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options:
            Options(headers: _headers, contentType: Headers.jsonContentType),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      FormData? formData,
      bool? hasToken}) async {
    try {
      await setHeaders(hasToken ?? true);

      final response = await _dio.put(
        path,
        queryParameters: queryParams,
        data: formData ?? body,
        options:
            Options(headers: _headers, contentType: Headers.jsonContentType),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  dynamic _handleResponseAsJson(Response response) {
    final responseAsJson = response.data.toString().isEmpty
        ? {}
        : jsonDecode(response.data.toString());
    return responseAsJson;
  }
}
