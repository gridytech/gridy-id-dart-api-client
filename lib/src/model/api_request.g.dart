
part of 'api_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiRequest extends ApiRequest {
  @override
  final String id;
  @override
  final String utcTime;
  @override
  final String apiUser;
  @override
  final int type;
  @override
  final String body;

  factory _$ApiRequest([void Function(ApiRequestBuilder)? updates]) =>
      (new ApiRequestBuilder()..update(updates))._build();

  _$ApiRequest._(
      {required this.id,
      required this.utcTime,
      required this.apiUser,
      required this.type,
      required this.body})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ApiRequest', 'id');
    BuiltValueNullFieldError.checkNotNull(utcTime, r'ApiRequest', 'utcTime');
    BuiltValueNullFieldError.checkNotNull(apiUser, r'ApiRequest', 'apiUser');
    BuiltValueNullFieldError.checkNotNull(type, r'ApiRequest', 'type');
    BuiltValueNullFieldError.checkNotNull(body, r'ApiRequest', 'body');
  }

  @override
  ApiRequest rebuild(void Function(ApiRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiRequestBuilder toBuilder() => new ApiRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiRequest &&
        id == other.id &&
        utcTime == other.utcTime &&
        apiUser == other.apiUser &&
        type == other.type &&
        body == other.body;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, utcTime.hashCode);
    _$hash = $jc(_$hash, apiUser.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiRequest')
          ..add('id', id)
          ..add('utcTime', utcTime)
          ..add('apiUser', apiUser)
          ..add('type', type)
          ..add('body', body))
        .toString();
  }
}

class ApiRequestBuilder implements Builder<ApiRequest, ApiRequestBuilder> {
  _$ApiRequest? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _utcTime;
  String? get utcTime => _$this._utcTime;
  set utcTime(String? utcTime) => _$this._utcTime = utcTime;

  String? _apiUser;
  String? get apiUser => _$this._apiUser;
  set apiUser(String? apiUser) => _$this._apiUser = apiUser;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  ApiRequestBuilder() {
    ApiRequest._defaults(this);
  }

  ApiRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _utcTime = $v.utcTime;
      _apiUser = $v.apiUser;
      _type = $v.type;
      _body = $v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiRequest;
  }

  @override
  void update(void Function(ApiRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiRequest build() => _build();

  _$ApiRequest _build() {
    final _$result = _$v ??
        new _$ApiRequest._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'ApiRequest', 'id'),
            utcTime: BuiltValueNullFieldError.checkNotNull(
                utcTime, r'ApiRequest', 'utcTime'),
            apiUser: BuiltValueNullFieldError.checkNotNull(
                apiUser, r'ApiRequest', 'apiUser'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ApiRequest', 'type'),
            body: BuiltValueNullFieldError.checkNotNull(
                body, r'ApiRequest', 'body'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
