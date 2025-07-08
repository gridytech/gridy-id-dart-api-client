//
//

import 'package:dio/dio.dart';
import 'package:gridy_id_client/src/utils/hmac_util.dart';
import '../constants.dart';
import 'auth.dart';

class HmacAuthInfo {
  final String apiuser;
  final String secret;

  const HmacAuthInfo(this.apiuser, this.secret);
}


class HmacAuthInterceptor extends AuthInterceptor {

  final Map<String, HmacAuthInfo> hmacInfo = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    final apiUser = hmacInfo['credential']?.apiuser ?? '';
    final apiSecret = hmacInfo['credential']?.secret ?? '';
    final hmacNonce = HmacUtil.getCNonce();
    final utcTime = DateTime.now().toUtc().millisecondsSinceEpoch;
    final authHeader = HmacUtil.generateHmac(apiUser,apiSecret,hmacNonce,utcTime);
    final authInfo = getAuthInfo(options, (secure) => secure['type'] == 'hmac');
    for (final info in authInfo) {
      final authName = info['name'] as String;
      final authKeyName = info['keyName'] as String;
      final authWhere = info['where'] as String;
        switch (authKeyName) {
          case 'x-gridy-apiuser':
            options.headers['x-gridy-apiuser'] = apiUser;
            break;
          case 'x-gridy-cnonce':
            options.headers['x-gridy-cnonce'] = hmacNonce;
            break;
          case 'x-gridy-utctime':
            options.headers['x-gridy-utctime'] = utcTime;
            break;
          case 'Authorization':
            options.headers['Authorization'] = authHeader;
            break;
          default:
            break;
        }
      }

    super.onRequest(options, handler);
  }
}
