import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../ui/common/local_storage.dart';
import '../ui/common/storage_dir.dart';
import 'api_constants.dart';
import 'api_response.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart';

enum HttpMethod { get, post, patch, put, delete }

class ApiService {
  final log = getLogger('ApiService');

  static final Map<String, String> _requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static final _options = BaseOptions(
    baseUrl: kApiBaseUrl,
    headers: _requestHeaders,
    connectTimeout: const Duration(seconds: 120),
    receiveTimeout: const Duration(seconds: 120),
  );

  Dio _dio() {
    Dio dio;
    if (kReleaseMode) {
      dio = Dio(_options);
    } else {
      dio = Dio(_options)
        ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ));
    }
    return dio;
  }

  Future<ApiResponse> call({
    required HttpMethod method,
    required String endpoint,
    Map<String, dynamic>? reqBody,
    FormData? formData,
    bool protected = true,
    bool useFormData = false,
    Map<String, dynamic> altHeaders = const {},
  }) async {
    /// Prevent Users from passing in formData and not
    /// getting responses because useFormData is not set
    if (formData != null || useFormData == true) {
      assert(() {
        if (formData == null || useFormData == false) {
          throw FlutterError.fromParts(<DiagnosticsNode>[
            ErrorSummary("useFormData != true or formData has not been passed"),
            ErrorDescription(
                "The call function was made without specifying if to useFormData or not but the "
                "formData body may have been passed without specifying to useFormData"),
            ErrorHint("If you are passing a formData to this function, \n\n"
                "ApiService.call(\n"
                "    ...\n"
                "     formData = FormData(...),\n"
                "     useFormData = true\n"
                ");\n\n\n")
          ]);
        }
        return true;
      }());
    }

    /// Check for path protection
    Map<String, dynamic>? extraHeaders = {};
    extraHeaders.addAll(altHeaders);
    if (protected) {
      if (extraHeaders["Authorization"] == null) {
        extraHeaders.addAll({"Authorization": "Bearer ${await _getToken()}"});
      }
    }

    try {
      switch (method) {
        case HttpMethod.post:
          Response response = await _dio().post(
            endpoint,
            data: useFormData ? formData : reqBody,
            options: Options(headers: extraHeaders),
          );
          return ApiResponse(response);

        case HttpMethod.get:
          Response response = await _dio().get(
            endpoint,
            options: Options(headers: extraHeaders),
          );
          return ApiResponse(response);
        case HttpMethod.patch:
          Response response = await _dio().patch(
            endpoint,
            data: useFormData ? formData : reqBody,
            options: Options(headers: extraHeaders),
          );
          return ApiResponse(response);
        case HttpMethod.put:
          Response response = await _dio().put(
            endpoint,
            data: useFormData ? formData : reqBody,
            options: Options(headers: extraHeaders),
          );
          return ApiResponse(response);
        case HttpMethod.delete:
          Response response = await _dio().delete(
            endpoint,
            data: useFormData ? formData : reqBody,
            options: Options(headers: extraHeaders),
          );
          return ApiResponse(response);
      }
    } on DioException catch (e, stackTrace) {
      log.e(stackTrace.toString());
      log.e(e.message);
      if (e.type == DioExceptionType.connectionTimeout) {
        return ApiResponse(
          Response(
              statusCode: kStatusTimeout,
              data: {
                "message": "Request timeout",
              },
              requestOptions: RequestOptions(path: '')),
        );
      } else if (e.type == DioExceptionType.unknown) {
        return ApiResponse(
          Response(
              statusCode: kStatusUnreachable,
              data: {
                "message": "Network is unreachable",
              },
              requestOptions: RequestOptions(path: '')),
        );
      }
      return ApiResponse(e.response ??
          Response(
              requestOptions: RequestOptions(path: ''),
              data: {
                "message": "Error Occurred",
              },
              statusCode: kStatusError));
    } catch (e, stackTrace) {
      log.e(stackTrace.toString());
      log.e(e);
      return ApiResponse(
        Response(
            statusCode: kStatusError,
            data: {
              "message": "Error Occurred",
            },
            requestOptions: RequestOptions(path: '')),
      );
    }
  }

  Future<String>? _getToken() async {
    final localStorage = locator<LocalStorage>();
    String? token = await localStorage.fetch(StorageDir.authToken);
    return token ?? "";
  }
}
