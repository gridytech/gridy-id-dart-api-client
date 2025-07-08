//
//

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:gridy_id_client/src/serializers.dart';
import 'package:gridy_id_client/src/auth/hmac_auth.dart';
import 'package:gridy_id_client/src/org/gridy/api/clients/gridy_id_service_api.dart';

class GridyClient {
  static const String basePath = r'https://api.gridy.io/prod';

  final Dio dio;
  final Serializers serializers;

  GridyClient({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000).inMilliseconds,
              receiveTimeout: const Duration(milliseconds: 3000).inMilliseconds,
              headers: {
                'user-agent': 'gridy-dart-client-v0.5.0'
               }
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        HmacAuthInterceptor()
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }

    (this.dio.httpClientAdapter as DefaultHttpClientAdapter)
        .onHttpClientCreate = (HttpClient _client) {
        _client.badCertificateCallback = (X509Certificate cert, String host, int port) {
            print( 'badCertificateCallback -> host: ${host}  port: ${port} cert: ${cert} ');
            return false;
        };
        return null;
    };
  }

  GridyClient setHmacAuth(String apiuser, String secret) {
    if (this.dio.interceptors.any((i) => i is HmacAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is HmacAuthInterceptor) as HmacAuthInterceptor).hmacInfo['credential'] = HmacAuthInfo(apiuser, secret);
    }
    return this;
  }

  ///
  GridyIDServiceApi getGridyIDServiceApi() {
    return GridyIDServiceApi(dio, serializers);
  }

}
