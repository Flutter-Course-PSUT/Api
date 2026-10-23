import 'package:json_annotation/json_annotation.dart';
part 'response_api_error.g.dart';

@JsonSerializable()
class ResponseApiError {
  final String? code;
  final String? description;
  final int? stautsCode;
  final String? error;

  ResponseApiError({
    required this.code,
    required this.description,
    required this.stautsCode,
    this.error,
  });

  factory ResponseApiError.fromJson(Map<String, dynamic> json) =>
      _$ResponseApiErrorFromJson(json);
}
