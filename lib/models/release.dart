import 'package:deep_pick/deep_pick.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'release.freezed.dart';

@freezed
class SourceRelease with _$SourceRelease {
  factory SourceRelease({
    required String tag,
    required List<SourceAsset> assets,
  }) = _SourceRelease;

  factory SourceRelease.fromJson(Map<String, dynamic> json) {
    return SourceRelease(
      tag: pick(json, 'tag_name').asStringOrThrow(),
      assets: pick(json, 'assets').asListOrThrow(
        (e) => SourceAsset.fromJson(e.asMapOrThrow()),
      ),
    );
  }
}

@freezed
class SourceAsset with _$SourceAsset {
  factory SourceAsset({
    required String name,
    required String url,
  }) = _SourceAsset;

  factory SourceAsset.fromJson(Map<String, dynamic> json) {
    return SourceAsset(
      name: pick(json, 'name').asStringOrThrow(),
      url: pick(json, 'browser_download_url').asStringOrThrow(),
    );
  }
}
