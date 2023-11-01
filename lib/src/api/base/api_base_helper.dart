import 'package:dio/dio.dart' as dio;

class ApiBaseHelper {
  ApiBaseHelper({required this.baseUrl});

  final String baseUrl;

  Future<dynamic> get(
    String endpoint,
    Map<String, String> headers,
    Map<String, dynamic> queryParameters,
  ) async {
    dynamic responseJson;
    final dioRequest = dio.Dio();

    final uri = getUri(baseUrl, endpoint, queryParameters);

    try {
      dioRequest.options.headers.addAll(headers);
      final response = await dioRequest.get<void>(uri.toString());

      responseJson = await _returnConvertedResponse(
        response,
      );
    } on dio.DioException catch (error) {
      responseJson = await _returnConvertedResponse(
        error.response!,
      );
    }

    return responseJson;
  }

  Future<dynamic> post(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;
    final dioRequest = dio.Dio();
    dioRequest.options.headers.addAll(headers ?? {});

    final uri = getUri(baseUrl, endpoint, null);

    try {
      final response = await dioRequest.post<void>(uri.toString(), data: body);

      responseJson = await _returnConvertedResponse(
        response,
      );
    } on dio.DioException catch (error) {
      responseJson = await _returnConvertedResponse(error.response!);
    }
    return responseJson;
  }

  Future<dynamic> put(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;
    final dioRequest = dio.Dio();
    dioRequest.options.headers.addAll(headers ?? {});

    final uri = getUri(baseUrl, endpoint, null);

    try {
      final response = await dioRequest.post<void>(uri.toString(), data: body);

      responseJson = await _returnConvertedResponse(
        response,
      );
    } on dio.DioException catch (error) {
      responseJson = await _returnConvertedResponse(error.response!);
    }
    return responseJson;
  }
}

Uri getUri(
  String uri,
  String endpoint,
  Map<String, dynamic>? queryParameters,
) {
  return Uri.https(uri, endpoint, queryParameters);
}

class APIException implements Exception {
  APIException({
    this.response,
    this.message,
  });

  final dio.Response<dynamic>? response;
  final dynamic message;

  @override
  String toString() {
    return '$message';
  }
}

class ApiBadRequestException extends APIException {
  ApiBadRequestException({super.response, super.message});
}

class ApiUnauthorizedException extends APIException {
  ApiUnauthorizedException({super.response, super.message});
}

class ApiForbiddenException extends APIException {
  ApiForbiddenException({super.response, super.message});
}

class ApiInvalidInputException extends APIException {
  ApiInvalidInputException({super.response, super.message});
}

class ApiConflictException extends APIException {
  ApiConflictException({super.response, super.message});
}

class ApiNotFoundException extends APIException {
  ApiNotFoundException({super.response, super.message});
}

dynamic _returnConvertedResponse(
  dio.Response<dynamic> response,
) async {
  switch (response.statusCode) {
    case 200:
      if (response.data.toString().isEmpty) {
        return <String, dynamic>{};
      }
      final responseJson = response.data;

      return responseJson;

    case 400:
      throw ApiBadRequestException(
        response: response,
        message: response.data.toString(),
      );

    case 401:
      throw ApiUnauthorizedException(
        response: response,
        message: response.data.toString(),
      );

    case 403:
      throw ApiForbiddenException(
        response: response,
        message: response.data.toString(),
      );

    case 404:
      throw ApiNotFoundException(
        response: response,
        message: response.data.toString(),
      );

    case 409:
      throw ApiConflictException(
        response: response,
        message: response.data.toString(),
      );

    case 500:
    default:
      throw APIException(
        response: response,
        message:
            'Error during communication with Server with StatusCode : ${response.statusCode}',
      );
  }
}
