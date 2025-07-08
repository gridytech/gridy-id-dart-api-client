//
//
//

import 'dart:async';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:gridy_id_client/src/model/api_request.dart';
import 'package:gridy_id_client/src/model/api_response.dart';

class GridyIDServiceApi {

  final Dio _dio;

  final Serializers _serializers;

  const GridyIDServiceApi(this._dio, this._serializers);

  /// Send or Cancel a Gridy ID MFA challenge request.
  /// 
  ///
  /// Parameters:
  /// * [apiRequest] - The JSON body of the request. Contains the Gridy ID challenge request.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ApiResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ApiResponse>> challenge({ 
    required ApiRequest apiRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/svc/challenge';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'hmac',
            'name': 'x-gridy-apiuser',
            'keyName': 'x-gridy-apiuser',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'x-gridy-cnonce',
            'keyName': 'x-gridy-cnonce',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'x-gridy-utctime',
            'keyName': 'x-gridy-utctime',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'GridyHmacAuth',
            'keyName': 'Authorization',
            'where': 'header',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json; charset=utf-8',

      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(ApiRequest);
      _bodyData = _serializers.serialize(apiRequest, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioError(
        requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ApiResponse? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(ApiResponse),
      ) as ApiResponse;

    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }

    return Response<ApiResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Check a Gridy ID MFA challenge status
  /// 
  ///
  /// Parameters:
  /// * [apiRequest] - The JSON body of the request. Contains the Status request.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ApiResponse] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<ApiResponse>> status({ 
    required ApiRequest apiRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/svc/status';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'hmac',
            'name': 'x-gridy-apiuser',
            'keyName': 'x-gridy-apiuser',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'x-gridy-cnonce',
            'keyName': 'x-gridy-cnonce',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'x-gridy-utctime',
            'keyName': 'x-gridy-utctime',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'GridyHmacAuth',
            'keyName': 'Authorization',
            'where': 'header',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json; charset=utf-8',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(ApiRequest);
      _bodyData = _serializers.serialize(apiRequest, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioError(
        requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ApiResponse? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(ApiResponse),
      ) as ApiResponse;

    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }

    return Response<ApiResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get current UTC time
  /// 
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ApiResponse] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<ApiResponse>> time({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/svc/time';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'hmac',
            'name': 'x-gridy-apiuser',
            'keyName': 'x-gridy-apiuser',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'x-gridy-cnonce',
            'keyName': 'x-gridy-cnonce',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'x-gridy-utctime',
            'keyName': 'x-gridy-utctime',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'GridyHmacAuth',
            'keyName': 'Authorization',
            'where': 'header',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ApiResponse? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(ApiResponse),
      ) as ApiResponse;

    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }

    return Response<ApiResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Verify a Gridy ID authentication code
  /// 
  ///
  /// Parameters:
  /// * [apiRequest] - The JSON body of the request. Contains the Gridy ID Verify request.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ApiResponse] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<ApiResponse>> verify({ 
    required ApiRequest apiRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/svc/verify';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'hmac',
            'name': 'x-gridy-apiuser',
            'keyName': 'x-gridy-apiuser',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'x-gridy-cnonce',
            'keyName': 'x-gridy-cnonce',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'x-gridy-utctime',
            'keyName': 'x-gridy-utctime',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'GridyHmacAuth',
            'keyName': 'Authorization',
            'where': 'header',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json; charset=utf-8',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(ApiRequest);
      _bodyData = _serializers.serialize(apiRequest, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioError(
        requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ApiResponse? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(ApiResponse),
      ) as ApiResponse;

    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }

    return Response<ApiResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }







  /// Check IPv4 & User Blocked Rules. 
  /// 
  ///
  /// Parameters:
  /// * [apiRequest] - The JSON body of the request. Contains the Gridy ID Blocked request.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ApiResponse] as data
  /// Throws [DioError] if API call or serialization fails
  Future<Response<ApiResponse>> blocked({ 
    required ApiRequest apiRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/svc/blocked';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'hmac',
            'name': 'x-gridy-apiuser',
            'keyName': 'x-gridy-apiuser',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'x-gridy-cnonce',
            'keyName': 'x-gridy-cnonce',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'x-gridy-utctime',
            'keyName': 'x-gridy-utctime',
            'where': 'header',
          },{
            'type': 'hmac',
            'name': 'GridyHmacAuth',
            'keyName': 'Authorization',
            'where': 'header',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json; charset=utf-8',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(ApiRequest);
      _bodyData = _serializers.serialize(apiRequest, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioError(
        requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ApiResponse? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(ApiResponse),
      ) as ApiResponse;

    } catch (error, stackTrace) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      )..stackTrace = stackTrace;
    }

    return Response<ApiResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }





}
