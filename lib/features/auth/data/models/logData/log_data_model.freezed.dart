// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LogDataModel _$LogDataModelFromJson(Map<String, dynamic> json) {
  return _LogDataModel.fromJson(json);
}

/// @nodoc
mixin _$LogDataModel {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get rememberMe => throw _privateConstructorUsedError;
  bool get biometricEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogDataModelCopyWith<LogDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogDataModelCopyWith<$Res> {
  factory $LogDataModelCopyWith(
          LogDataModel value, $Res Function(LogDataModel) then) =
      _$LogDataModelCopyWithImpl<$Res, LogDataModel>;
  @useResult
  $Res call(
      {String username,
      String password,
      bool rememberMe,
      bool biometricEnabled});
}

/// @nodoc
class _$LogDataModelCopyWithImpl<$Res, $Val extends LogDataModel>
    implements $LogDataModelCopyWith<$Res> {
  _$LogDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? rememberMe = null,
    Object? biometricEnabled = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricEnabled: null == biometricEnabled
          ? _value.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogDataModelImplCopyWith<$Res>
    implements $LogDataModelCopyWith<$Res> {
  factory _$$LogDataModelImplCopyWith(
          _$LogDataModelImpl value, $Res Function(_$LogDataModelImpl) then) =
      __$$LogDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String password,
      bool rememberMe,
      bool biometricEnabled});
}

/// @nodoc
class __$$LogDataModelImplCopyWithImpl<$Res>
    extends _$LogDataModelCopyWithImpl<$Res, _$LogDataModelImpl>
    implements _$$LogDataModelImplCopyWith<$Res> {
  __$$LogDataModelImplCopyWithImpl(
      _$LogDataModelImpl _value, $Res Function(_$LogDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? rememberMe = null,
    Object? biometricEnabled = null,
  }) {
    return _then(_$LogDataModelImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricEnabled: null == biometricEnabled
          ? _value.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogDataModelImpl implements _LogDataModel {
  const _$LogDataModelImpl(
      {this.username = "",
      this.password = "",
      this.rememberMe = false,
      this.biometricEnabled = false});

  factory _$LogDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogDataModelImplFromJson(json);

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final bool rememberMe;
  @override
  @JsonKey()
  final bool biometricEnabled;

  @override
  String toString() {
    return 'LogDataModel(username: $username, password: $password, rememberMe: $rememberMe, biometricEnabled: $biometricEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogDataModelImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe) &&
            (identical(other.biometricEnabled, biometricEnabled) ||
                other.biometricEnabled == biometricEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, username, password, rememberMe, biometricEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogDataModelImplCopyWith<_$LogDataModelImpl> get copyWith =>
      __$$LogDataModelImplCopyWithImpl<_$LogDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogDataModelImplToJson(
      this,
    );
  }
}

abstract class _LogDataModel implements LogDataModel {
  const factory _LogDataModel(
      {final String username,
      final String password,
      final bool rememberMe,
      final bool biometricEnabled}) = _$LogDataModelImpl;

  factory _LogDataModel.fromJson(Map<String, dynamic> json) =
      _$LogDataModelImpl.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  bool get rememberMe;
  @override
  bool get biometricEnabled;
  @override
  @JsonKey(ignore: true)
  _$$LogDataModelImplCopyWith<_$LogDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
