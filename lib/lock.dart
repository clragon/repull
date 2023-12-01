import 'package:freezed_annotation/freezed_annotation.dart';

part 'lock.freezed.dart';
part 'lock.g.dart';

@freezed
class RepullLock with _$RepullLock {
  const factory RepullLock({
    required String repo,
    String? tag,
    int? lastUpdate,
  }) = _RepullLock;

  factory RepullLock.fromJson(Map<String, dynamic> json) =>
      _$RepullLockFromJson(json);
}
