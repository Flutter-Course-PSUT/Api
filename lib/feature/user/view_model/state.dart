import 'package:api/core/model_error/response_api_error.dart';

abstract class UserState {}

class UserInitState extends UserState {}

class UserLoadingState extends UserState {}

class UserErrorState extends UserState {
  final ResponseApiError responseApiError;

  UserErrorState({required this.responseApiError});
}

class UserSuccessState extends UserState {}

class UserDeleteLoadingState extends UserState {}

class UserDeleteErrorState extends UserState {
  final ResponseApiError responseApiError;

  UserDeleteErrorState({required this.responseApiError});
}

class UserDeleteSuccessState extends UserState {}

class UserSearchLoadingState extends UserState {}

class UserSearchErrorState extends UserState {
  final ResponseApiError responseApiError;

  UserSearchErrorState({required this.responseApiError});
}

class UserSearchSuccessState extends UserState {}
