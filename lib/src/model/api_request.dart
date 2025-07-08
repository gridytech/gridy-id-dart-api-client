//
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_request.g.dart';

/// ApiRequest
///
/// Properties:
/// * [id] 
/// * [utcTime] 
/// * [apiUser] 
/// * [type] 
/// * [body] 
@BuiltValue()
abstract class ApiRequest implements Built<ApiRequest, ApiRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'utcTime')
  String get utcTime;

  @BuiltValueField(wireName: r'apiUser')
  String get apiUser;

  @BuiltValueField(wireName: r'type')
  int get type;

  @BuiltValueField(wireName: r'body')
  String get body;

  ApiRequest._();

  factory ApiRequest([void updates(ApiRequestBuilder b)]) = _$ApiRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiRequest> get serializer => _$ApiRequestSerializer();
}

class _$ApiRequestSerializer implements PrimitiveSerializer<ApiRequest> {
  @override
  final Iterable<Type> types = const [ApiRequest, _$ApiRequest];

  @override
  final String wireName = r'ApiRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiRequest object, {
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
    yield r'apiUser';
    yield serializers.serialize(
      object.apiUser,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(int),
    );
    yield r'body';
    yield serializers.serialize(
      object.body,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiRequestBuilder result,
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
        case r'apiUser':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.apiUser = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.type = valueDes;
          break;
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiRequestBuilder();
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

