import 'package:freezed_annotation/freezed_annotation.dart';

part 'args.freezed.dart';
part 'args.g.dart';

@freezed
class RepullArgs with _$RepullArgs {
  const factory RepullArgs({
    required String config,
    required bool now,
    required bool help,
  }) = _RepullArgs;

  factory RepullArgs.fromJson(Map<String, dynamic> json) =>
      _$RepullArgsFromJson(json);
}
