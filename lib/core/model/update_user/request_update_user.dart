import 'package:json_annotation/json_annotation.dart';
part 'request_update_user.g.dart';

@JsonSerializable()
class RequestUpdateUser {
  final String? fullName;
  final String? email;
  final String? password;
  final String? userName;
  final String? phoneNumber;

  RequestUpdateUser({
    required this.fullName,
    required this.email,
    required this.password,
    required this.userName,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$RequestUpdateUserToJson(this);
}
