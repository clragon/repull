// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SourceRelease {
  String get tag => throw _privateConstructorUsedError;
  List<SourceAsset> get assets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SourceReleaseCopyWith<SourceRelease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceReleaseCopyWith<$Res> {
  factory $SourceReleaseCopyWith(
          SourceRelease value, $Res Function(SourceRelease) then) =
      _$SourceReleaseCopyWithImpl<$Res, SourceRelease>;
  @useResult
  $Res call({String tag, List<SourceAsset> assets});
}

/// @nodoc
class _$SourceReleaseCopyWithImpl<$Res, $Val extends SourceRelease>
    implements $SourceReleaseCopyWith<$Res> {
  _$SourceReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<SourceAsset>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceReleaseImplCopyWith<$Res>
    implements $SourceReleaseCopyWith<$Res> {
  factory _$$SourceReleaseImplCopyWith(
          _$SourceReleaseImpl value, $Res Function(_$SourceReleaseImpl) then) =
      __$$SourceReleaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tag, List<SourceAsset> assets});
}

/// @nodoc
class __$$SourceReleaseImplCopyWithImpl<$Res>
    extends _$SourceReleaseCopyWithImpl<$Res, _$SourceReleaseImpl>
    implements _$$SourceReleaseImplCopyWith<$Res> {
  __$$SourceReleaseImplCopyWithImpl(
      _$SourceReleaseImpl _value, $Res Function(_$SourceReleaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? assets = null,
  }) {
    return _then(_$SourceReleaseImpl(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<SourceAsset>,
    ));
  }
}

/// @nodoc

class _$SourceReleaseImpl implements _SourceRelease {
  _$SourceReleaseImpl(
      {required this.tag, required final List<SourceAsset> assets})
      : _assets = assets;

  @override
  final String tag;
  final List<SourceAsset> _assets;
  @override
  List<SourceAsset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'SourceRelease(tag: $tag, assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceReleaseImpl &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, tag, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceReleaseImplCopyWith<_$SourceReleaseImpl> get copyWith =>
      __$$SourceReleaseImplCopyWithImpl<_$SourceReleaseImpl>(this, _$identity);
}

abstract class _SourceRelease implements SourceRelease {
  factory _SourceRelease(
      {required final String tag,
      required final List<SourceAsset> assets}) = _$SourceReleaseImpl;

  @override
  String get tag;
  @override
  List<SourceAsset> get assets;
  @override
  @JsonKey(ignore: true)
  _$$SourceReleaseImplCopyWith<_$SourceReleaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SourceAsset {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SourceAssetCopyWith<SourceAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceAssetCopyWith<$Res> {
  factory $SourceAssetCopyWith(
          SourceAsset value, $Res Function(SourceAsset) then) =
      _$SourceAssetCopyWithImpl<$Res, SourceAsset>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$SourceAssetCopyWithImpl<$Res, $Val extends SourceAsset>
    implements $SourceAssetCopyWith<$Res> {
  _$SourceAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceAssetImplCopyWith<$Res>
    implements $SourceAssetCopyWith<$Res> {
  factory _$$SourceAssetImplCopyWith(
          _$SourceAssetImpl value, $Res Function(_$SourceAssetImpl) then) =
      __$$SourceAssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$SourceAssetImplCopyWithImpl<$Res>
    extends _$SourceAssetCopyWithImpl<$Res, _$SourceAssetImpl>
    implements _$$SourceAssetImplCopyWith<$Res> {
  __$$SourceAssetImplCopyWithImpl(
      _$SourceAssetImpl _value, $Res Function(_$SourceAssetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$SourceAssetImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SourceAssetImpl implements _SourceAsset {
  _$SourceAssetImpl({required this.name, required this.url});

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'SourceAsset(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceAssetImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceAssetImplCopyWith<_$SourceAssetImpl> get copyWith =>
      __$$SourceAssetImplCopyWithImpl<_$SourceAssetImpl>(this, _$identity);
}

abstract class _SourceAsset implements SourceAsset {
  factory _SourceAsset(
      {required final String name,
      required final String url}) = _$SourceAssetImpl;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$SourceAssetImplCopyWith<_$SourceAssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
