import 'dart:core';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'dart:typed_data';
import "package:pointycastle/export.dart";
import 'package:uuid/uuid.dart';

class HmacUtil{

  ///
  static String generateHmac( String apiUser,String apiSecret,String hmacNonce,int hmacUtcTime ){
    _validateFields( apiUser,hmacNonce,hmacUtcTime );
    return _generateHmacSig( apiUser,apiSecret, hmacNonce,hmacUtcTime );
  }


  ///
  static String _generateHmacSig( apiUser,apiSecret,hmacNonce,hmacUtcTime ){
    final String secretKey = apiSecret;
    final String data = 'x-gridy-utctime: $hmacUtcTime\nx-gridy-cnonce: $hmacNonce';
    return _calculateHmac(secretKey,data);
  }

  ///
  static String _calculateHmac( String secretkey, String content ) {
    final key = utf8.encode( secretkey );
    final data = utf8.encode( content );
    final hmacValue = hmacSha512( Uint8List.fromList(key), Uint8List.fromList(data) );
    final hmacHex = hex.encode( hmacValue );
    return hmacHex;
  }


  ///
  static Uint8List hmacSha512(Uint8List hmacKey, Uint8List data) {
    final hmac = HMac(SHA512Digest(), 128)
      ..init(KeyParameter(hmacKey));
    return hmac.process(data);
  }

  ///
  static void _validateFields( String apiUser,String hmacNonce,int hmacUtcTime ){
    if (apiUser == null) {
      throw new Exception("API User required for GridyHmacAPI Auth");
    }

    if (hmacUtcTime == null) {
      throw new Exception("UTC Time required for GridyHmacAPI Auth");
    }

    if (hmacNonce == null) {
      throw new Exception("CNonce required for GridyHmacAPI Auth");
    }
  }

  ///
  static String getCNonce(){
    var uuid = Uuid();
    return uuid.v1();
  }


}
