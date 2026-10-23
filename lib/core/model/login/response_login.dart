import 'package:json_annotation/json_annotation.dart';
part 'response_login.g.dart';

@JsonSerializable()
class ResponseLogin {
  final String? userid;
  final String? email;
  final String? fullName;
  final String? token;

  ResponseLogin({
    required this.userid,
    required this.email,
    required this.fullName,
    required this.token,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginFromJson(json);
}
