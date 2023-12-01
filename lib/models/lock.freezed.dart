// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepullLock _$RepullLockFromJson(Map<String, dynamic> json) {
  return _RepullLock.fromJson(json);
}

/// @nodoc
mixin _$RepullLock {
  String get repo => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  int? get lastUpdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepullLockCopyWith<RepullLock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepullLockCopyWith<$Res> {
  factory $RepullLockCopyWith(
          RepullLock value, $Res Function(RepullLock) then) =
      _$RepullLockCopyWithImpl<$Res, RepullLock>;
  @useResult
  $Res call({String repo, String? tag, int? lastUpdate});
}

/// @nodoc
class _$RepullLockCopyWithImpl<$Res, $Val extends RepullLock>
    implements $RepullLockCopyWith<$Res> {
  _$RepullLockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repo = null,
    Object? tag = freezed,
    Object? lastUpdate = freezed,
  }) {
    return _then(_value.copyWith(
      repo: null == repo
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as String,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepullLockImplCopyWith<$Res>
    implements $RepullLockCopyWith<$Res> {
  factory _$$RepullLockImplCopyWith(
          _$RepullLockImpl value, $Res Function(_$RepullLockImpl) then) =
      __$$RepullLockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String repo, String? tag, int? lastUpdate});
}

/// @nodoc
class __$$RepullLockImplCopyWithImpl<$Res>
    extends _$RepullLockCopyWithImpl<$Res, _$RepullLockImpl>
    implements _$$RepullLockImplCopyWith<$Res> {
  __$$RepullLockImplCopyWithImpl(
      _$RepullLockImpl _value, $Res Function(_$RepullLockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repo = null,
    Object? tag = freezed,
    Object? lastUpdate = freezed,
  }) {
    return _then(_$RepullLockImpl(
      repo: null == repo
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as String,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepullLockImpl implements _RepullLock {
  const _$RepullLockImpl({required this.repo, this.tag, this.lastUpdate});

  factory _$RepullLockImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepullLockImplFromJson(json);

  @override
  final String repo;
  @override
  final String? tag;
  @override
  final int? lastUpdate;

  @override
  String toString() {
    return 'RepullLock(repo: $repo, tag: $tag, lastUpdate: $lastUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepullLockImpl &&
            (identical(other.repo, repo) || other.repo == repo) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, repo, tag, lastUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepullLockImplCopyWith<_$RepullLockImpl> get copyWith =>
      __$$RepullLockImplCopyWithImpl<_$RepullLockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepullLockImplToJson(
      this,
    );
  }
}

abstract class _RepullLock implements RepullLock {
  const factory _RepullLock(
      {required final String repo,
      final String? tag,
      final int? lastUpdate}) = _$RepullLockImpl;

  factory _RepullLock.fromJson(Map<String, dynamic> json) =
      _$RepullLockImpl.fromJson;

  @override
  String get repo;
  @override
  String? get tag;
  @override
  int? get lastUpdate;
  @override
  @JsonKey(ignore: true)
  _$$RepullLockImplCopyWith<_$RepullLockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
