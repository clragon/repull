// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepullSource _$RepullSourceFromJson(Map<String, dynamic> json) {
  return _RepullSource.fromJson(json);
}

/// @nodoc
mixin _$RepullSource {
  String get repo => throw _privateConstructorUsedError;
  String get deploy => throw _privateConstructorUsedError;
  int get intervall => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepullSourceCopyWith<RepullSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepullSourceCopyWith<$Res> {
  factory $RepullSourceCopyWith(
          RepullSource value, $Res Function(RepullSource) then) =
      _$RepullSourceCopyWithImpl<$Res, RepullSource>;
  @useResult
  $Res call({String repo, String deploy, int intervall});
}

/// @nodoc
class _$RepullSourceCopyWithImpl<$Res, $Val extends RepullSource>
    implements $RepullSourceCopyWith<$Res> {
  _$RepullSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repo = null,
    Object? deploy = null,
    Object? intervall = null,
  }) {
    return _then(_value.copyWith(
      repo: null == repo
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as String,
      deploy: null == deploy
          ? _value.deploy
          : deploy // ignore: cast_nullable_to_non_nullable
              as String,
      intervall: null == intervall
          ? _value.intervall
          : intervall // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepullSourceImplCopyWith<$Res>
    implements $RepullSourceCopyWith<$Res> {
  factory _$$RepullSourceImplCopyWith(
          _$RepullSourceImpl value, $Res Function(_$RepullSourceImpl) then) =
      __$$RepullSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String repo, String deploy, int intervall});
}

/// @nodoc
class __$$RepullSourceImplCopyWithImpl<$Res>
    extends _$RepullSourceCopyWithImpl<$Res, _$RepullSourceImpl>
    implements _$$RepullSourceImplCopyWith<$Res> {
  __$$RepullSourceImplCopyWithImpl(
      _$RepullSourceImpl _value, $Res Function(_$RepullSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repo = null,
    Object? deploy = null,
    Object? intervall = null,
  }) {
    return _then(_$RepullSourceImpl(
      repo: null == repo
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as String,
      deploy: null == deploy
          ? _value.deploy
          : deploy // ignore: cast_nullable_to_non_nullable
              as String,
      intervall: null == intervall
          ? _value.intervall
          : intervall // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepullSourceImpl implements _RepullSource {
  const _$RepullSourceImpl(
      {required this.repo, required this.deploy, this.intervall = 86400});

  factory _$RepullSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepullSourceImplFromJson(json);

  @override
  final String repo;
  @override
  final String deploy;
  @override
  @JsonKey()
  final int intervall;

  @override
  String toString() {
    return 'RepullSource(repo: $repo, deploy: $deploy, intervall: $intervall)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepullSourceImpl &&
            (identical(other.repo, repo) || other.repo == repo) &&
            (identical(other.deploy, deploy) || other.deploy == deploy) &&
            (identical(other.intervall, intervall) ||
                other.intervall == intervall));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, repo, deploy, intervall);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepullSourceImplCopyWith<_$RepullSourceImpl> get copyWith =>
      __$$RepullSourceImplCopyWithImpl<_$RepullSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepullSourceImplToJson(
      this,
    );
  }
}

abstract class _RepullSource implements RepullSource {
  const factory _RepullSource(
      {required final String repo,
      required final String deploy,
      final int intervall}) = _$RepullSourceImpl;

  factory _RepullSource.fromJson(Map<String, dynamic> json) =
      _$RepullSourceImpl.fromJson;

  @override
  String get repo;
  @override
  String get deploy;
  @override
  int get intervall;
  @override
  @JsonKey(ignore: true)
  _$$RepullSourceImplCopyWith<_$RepullSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
