import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.freezed.dart';
part 'source.g.dart';

@freezed
class RepullSource with _$RepullSource {
  const factory RepullSource({
    required String repo,
    required String deploy,
    @Default(86400) int intervall,
  }) = _RepullSource;

  factory RepullSource.fromJson(Map<String, dynamic> json) =>
      _$RepullSourceFromJson(json);
}
