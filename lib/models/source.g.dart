// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepullSourceImpl _$$RepullSourceImplFromJson(Map<String, dynamic> json) =>
    _$RepullSourceImpl(
      repo: json['repo'] as String,
      deploy: json['deploy'] as String,
      intervall: json['intervall'] as int? ?? 86400,
    );

Map<String, dynamic> _$$RepullSourceImplToJson(_$RepullSourceImpl instance) =>
    <String, dynamic>{
      'repo': instance.repo,
      'deploy': instance.deploy,
      'intervall': instance.intervall,
    };
