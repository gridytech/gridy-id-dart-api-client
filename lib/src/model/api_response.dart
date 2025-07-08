//
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_response.g.dart';

/// ApiResponse
///
/// Properties:
/// * [id] 
/// * [utcTime] 
/// * [status] 
/// * [message] 
/// * [code] 
/// * [moreInfo] 
@BuiltValue()
abstract class ApiResponse implements Built<ApiResponse, ApiResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'utcTime')
  String get utcTime;

  @BuiltValueField(wireName: r'status')
  int get status;

  @BuiltValueField(wireName: r'message')
  String get message;

  @BuiltValueField(wireName: r'code')
  int get code;

  @BuiltValueField(wireName: r'moreInfo')
  String? get moreInfo;

  ApiResponse._();

  factory ApiResponse([void updates(ApiResponseBuilder b)]) = _$ApiResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiResponse> get serializer => _$ApiResponseSerializer();
}

class _$ApiResponseSerializer implements PrimitiveSerializer<ApiResponse> {
  @override
  final Iterable<Type> types = const [ApiResponse, _$ApiResponse];

  @override
  final String wireName = r'ApiResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'utcTime';
    yield serializers.serialize(
      object.utcTime,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(int),
    );
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(int),
    );
    if (object.moreInfo != null) {
      yield r'moreInfo';
      yield serializers.serialize(
        object.moreInfo,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'utcTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.utcTime = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.status = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'moreInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.moreInfo = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

