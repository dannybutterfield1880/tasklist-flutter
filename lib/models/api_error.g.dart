// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) {
  return ApiError(
    const CustomExceptionConverter().fromJson(json['exception'] as String),
    json['code'] as int,
  );
}

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'exception': const CustomExceptionConverter().toJson(instance.exception),
      'code': instance.code,
    };
