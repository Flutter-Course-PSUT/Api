import 'package:api/core/model_error/response_api_error.dart';

abstract class UpdateUserState {}

class UpdateuserInitState extends UpdateUserState {}

class UpdateuserLoadingState extends UpdateUserState {}

class UpdateuserErrorState extends UpdateUserState {
  final ResponseApiError responseApiError;

  UpdateuserErrorState({required this.responseApiError});
}

class UpdateuserSucessState extends UpdateUserState {}
