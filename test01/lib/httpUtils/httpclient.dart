import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test01/httpUtils/request_config.dart';
import 'package:dio/dio.dart';
import 'package:test01/httpUtils/ApiException.dart';
import 'package:test01/model/api_response_entity.dart';
import 'package:test01/httpUtils/RawData.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class HttpClient {
  late Dio _dio;

  HttpClient() {
    _dio = Dio(BaseOptions(
        baseUrl: RequestConfig.baseUrl,
        sendTimeout: const Duration(milliseconds: 15000),
        receiveTimeout: const Duration(milliseconds: 15000)));
    _dio.interceptors.add(PrettyDioLogger());
  }

  HttpClient.create(this._dio);

  Future<T?> request<T>(
    String url, {
    String method = "Get",
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool Function(ApiException)? onError,
  }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;
      data = _convertRequestData(data);
      Response response = await _dio.request(url,
          queryParameters: queryParameters, data: data, options: options);
      return _handleResponse<T>(response);
    } catch (e) {
      var exception = ApiException.from(e);
      if (onError?.call(exception) != true) {
        throw exception;
      }
    }
    return null;
  }

  Future<T?> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        queryParameters: queryParameters, headers: headers, onError: onError);
  }

  Future<T?> post<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        method: "POST",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  Future<T?> delete<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        method: "DELETE",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  Future<T?> put<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        method: "PUT",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }


  T? _handleResponse<T>(Response response) {
   // return response.data;
    if (response.statusCode == 200) {
      if(T.toString() == (RawData).toString()){
        RawData raw = RawData();
        raw.value = response.data;
        return raw as T;
      }else {
        ApiResponseEntity<T> apiResponse = ApiResponseEntity<T>.fromJson(response.data);
        return _handleBusinessResponse<T>(apiResponse);
      }
    } else {
      var exception = ApiException(response.statusCode, ApiException.unknownException);
      throw exception;
    }
  }

  _convertRequestData(data) {
    if (data != null) {
      data = jsonDecode(jsonEncode(data));
    }
    return data;
  }

  ///业务内容处理
  T? _handleBusinessResponse<T>(ApiResponseEntity<T> response) {
    if (response.errorCode == RequestConfig.successCode) {
      return response.data;
    } else {
      var exception = ApiException(response.errorCode, response.errorMsg);
      throw exception;
    }
  }
}
