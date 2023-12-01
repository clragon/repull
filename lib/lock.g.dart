// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepullLockImpl _$$RepullLockImplFromJson(Map<String, dynamic> json) =>
    _$RepullLockImpl(
      repo: json['repo'] as String,
      tag: json['tag'] as String?,
      lastUpdate: json['lastUpdate'] as int?,
    );

Map<String, dynamic> _$$RepullLockImplToJson(_$RepullLockImpl instance) =>
    <String, dynamic>{
      'repo': instance.repo,
      'tag': instance.tag,
      'lastUpdate': instance.lastUpdate,
    };
