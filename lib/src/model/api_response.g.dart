
part of 'api_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResponse extends ApiResponse {
  @override
  final String id;
  @override
  final String utcTime;
  @override
  final int status;
  @override
  final String message;
  @override
  final int code;
  @override
  final String? moreInfo;

  factory _$ApiResponse([void Function(ApiResponseBuilder)? updates]) =>
      (new ApiResponseBuilder()..update(updates))._build();

  _$ApiResponse._(
      {required this.id,
      required this.utcTime,
      required this.status,
      required this.message,
      required this.code,
      this.moreInfo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ApiResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(utcTime, r'ApiResponse', 'utcTime');
    BuiltValueNullFieldError.checkNotNull(status, r'ApiResponse', 'status');
    BuiltValueNullFieldError.checkNotNull(message, r'ApiResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(code, r'ApiResponse', 'code');
  }

  @override
  ApiResponse rebuild(void Function(ApiResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseBuilder toBuilder() => new ApiResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponse &&
        id == other.id &&
        utcTime == other.utcTime &&
        status == other.status &&
        message == other.message &&
        code == other.code &&
        moreInfo == other.moreInfo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, utcTime.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, moreInfo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiResponse')
          ..add('id', id)
          ..add('utcTime', utcTime)
          ..add('status', status)
          ..add('message', message)
          ..add('code', code)
          ..add('moreInfo', moreInfo))
        .toString();
  }
}

class ApiResponseBuilder implements Builder<ApiResponse, ApiResponseBuilder> {
  _$ApiResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _utcTime;
  String? get utcTime => _$this._utcTime;
  set utcTime(String? utcTime) => _$this._utcTime = utcTime;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _moreInfo;
  String? get moreInfo => _$this._moreInfo;
  set moreInfo(String? moreInfo) => _$this._moreInfo = moreInfo;

  ApiResponseBuilder() {
    ApiResponse._defaults(this);
  }

  ApiResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _utcTime = $v.utcTime;
      _status = $v.status;
      _message = $v.message;
      _code = $v.code;
      _moreInfo = $v.moreInfo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiResponse;
  }

  @override
  void update(void Function(ApiResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResponse build() => _build();

  _$ApiResponse _build() {
    final _$result = _$v ??
        new _$ApiResponse._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'ApiResponse', 'id'),
            utcTime: BuiltValueNullFieldError.checkNotNull(
                utcTime, r'ApiResponse', 'utcTime'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ApiResponse', 'status'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiResponse', 'message'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ApiResponse', 'code'),
            moreInfo: moreInfo);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
