// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseApiError _$ResponseApiErrorFromJson(Map<String, dynamic> json) =>
    ResponseApiError(
      code: json['code'] as String?,
      description: json['description'] as String?,
      stautsCode: (json['stautsCode'] as num?)?.toInt(),
      error: json['error'] as String?,
    );
