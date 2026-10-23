import 'package:json_annotation/json_annotation.dart';
part 'response_user.g.dart';

@JsonSerializable()
class ResponseUser {
  final String? id;
  final String? fullName;
  final String? email;
  final String? userName;
  final String? phoneNumber;

  ResponseUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.userName,
    required this.phoneNumber,
  });

  factory ResponseUser.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserFromJson(json);
}
