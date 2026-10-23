import 'package:json_annotation/json_annotation.dart';
part 'request_login.g.dart';

@JsonSerializable()
class RequestLogin {
  final String? email;
  final String? password;

  RequestLogin({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$RequestLoginToJson(this);
}
