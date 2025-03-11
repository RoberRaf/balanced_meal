import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterflow_task/core/services/network/error_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

extension ResposnseSuccess on Response {
  bool get isSuccess => (statusCode ?? 500) < 400;
}

class ApiClient {
  static final ApiClient _instance = ApiClient._();
  factory ApiClient() => _instance;

  final Dio _dio = Dio();
  static final mainDomain = "https://www.r-boules.dev/public/";
  static final secondDomain = "https://uz8if7.buildship.run/";

  ApiClient._() {
    _dio.options = BaseOptions(
      baseUrl: mainDomain,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => (status ?? 500) < 500,
      headers: {'accept': 'application/json', 'Content-Type': 'application/json', 'Charset': 'utf-8'},
    );
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
    }
  }

  void switchDomain(bool isSecondDomain) {
    _dio.options.baseUrl = isSecondDomain ? secondDomain : mainDomain;
  }

  Future<({Response response, ErrorModel? error})> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final custHeaders = <String, dynamic>{};
      if (headers != null) custHeaders.addAll(headers);
      final response =
          await _dio.get(endpoint, queryParameters: queryParameters, options: Options(headers: custHeaders));
      return (response: response, error: _returnErrorIfExist(response));
    } on DioException catch (e) {
      return _defaultError();
    } catch (e) {
      return _defaultError();
    } finally {}
  }

  Future<({Response response, ErrorModel? error})> post({
    required String endpoint,
    required var requestBody,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration? customRequestDuration,
    void Function(int, int)? onSendProgress,
  }) async {
    try {
      final custHeaders = <String, dynamic>{};
      if (headers != null) custHeaders.addAll(headers);
      final response = await _dio.post(endpoint,
          queryParameters: queryParameters,
          data: requestBody,
          onSendProgress: onSendProgress,
          options: Options(
            receiveTimeout: customRequestDuration,
            sendTimeout: customRequestDuration,
            headers: custHeaders,
          ));
      return (response: response, error: _returnErrorIfExist(response));
    } on DioException catch (e) {
      return _defaultError();
    } catch (e) {
      return _defaultError();
    }
  }

  ({Response response, ErrorModel? error}) _defaultError() {
    final error = "Something went wrong";
    return (response: Response(requestOptions: RequestOptions()), error: ErrorModel(message: error, errors: [error]));
  }

  ErrorModel? _returnErrorIfExist(Response response) {
    if ((response.statusCode ?? 500) >= 400) {
      final error = "Something went wrong";
      final errorModel = ErrorModel.fromJson(response.data);
      return ErrorModel(
        message: errorModel.message ?? error,
        errors: errorModel.errors ?? [errorModel.message ?? error],
      );
    } else if (response.data is Map && response.data['status'] == false) {
      return ErrorModel(message: response.data['message']);
    }
    return null;
  }
}
