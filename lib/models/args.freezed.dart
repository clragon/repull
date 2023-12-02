// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepullArgs _$RepullArgsFromJson(Map<String, dynamic> json) {
  return _RepullArgs.fromJson(json);
}

/// @nodoc
mixin _$RepullArgs {
  String get config => throw _privateConstructorUsedError;
  bool get now => throw _privateConstructorUsedError;
  bool get help => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepullArgsCopyWith<RepullArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepullArgsCopyWith<$Res> {
  factory $RepullArgsCopyWith(
          RepullArgs value, $Res Function(RepullArgs) then) =
      _$RepullArgsCopyWithImpl<$Res, RepullArgs>;
  @useResult
  $Res call({String config, bool now, bool help});
}

/// @nodoc
class _$RepullArgsCopyWithImpl<$Res, $Val extends RepullArgs>
    implements $RepullArgsCopyWith<$Res> {
  _$RepullArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? now = null,
    Object? help = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as String,
      now: null == now
          ? _value.now
          : now // ignore: cast_nullable_to_non_nullable
              as bool,
      help: null == help
          ? _value.help
          : help // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepullArgsImplCopyWith<$Res>
    implements $RepullArgsCopyWith<$Res> {
  factory _$$RepullArgsImplCopyWith(
          _$RepullArgsImpl value, $Res Function(_$RepullArgsImpl) then) =
      __$$RepullArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String config, bool now, bool help});
}

/// @nodoc
class __$$RepullArgsImplCopyWithImpl<$Res>
    extends _$RepullArgsCopyWithImpl<$Res, _$RepullArgsImpl>
    implements _$$RepullArgsImplCopyWith<$Res> {
  __$$RepullArgsImplCopyWithImpl(
      _$RepullArgsImpl _value, $Res Function(_$RepullArgsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? now = null,
    Object? help = null,
  }) {
    return _then(_$RepullArgsImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as String,
      now: null == now
          ? _value.now
          : now // ignore: cast_nullable_to_non_nullable
              as bool,
      help: null == help
          ? _value.help
          : help // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepullArgsImpl implements _RepullArgs {
  const _$RepullArgsImpl(
      {required this.config, required this.now, required this.help});

  factory _$RepullArgsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepullArgsImplFromJson(json);

  @override
  final String config;
  @override
  final bool now;
  @override
  final bool help;

  @override
  String toString() {
    return 'RepullArgs(config: $config, now: $now, help: $help)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepullArgsImpl &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.now, now) || other.now == now) &&
            (identical(other.help, help) || other.help == help));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, config, now, help);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepullArgsImplCopyWith<_$RepullArgsImpl> get copyWith =>
      __$$RepullArgsImplCopyWithImpl<_$RepullArgsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepullArgsImplToJson(
      this,
    );
  }
}

abstract class _RepullArgs implements RepullArgs {
  const factory _RepullArgs(
      {required final String config,
      required final bool now,
      required final bool help}) = _$RepullArgsImpl;

  factory _RepullArgs.fromJson(Map<String, dynamic> json) =
      _$RepullArgsImpl.fromJson;

  @override
  String get config;
  @override
  bool get now;
  @override
  bool get help;
  @override
  @JsonKey(ignore: true)
  _$$RepullArgsImplCopyWith<_$RepullArgsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
