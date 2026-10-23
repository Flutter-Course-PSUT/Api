import 'package:api/core/model/login/request_login.dart';
import 'package:api/core/model/login/response_login.dart';
import 'package:api/core/model_error/response_api_error.dart';
import 'package:api/core/usecase/login/login_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginRepo {
  final _loginUsecase = LoginUsecase();
  Future<Either<ResponseApiError, ResponseLogin>> login({
    required RequestLogin requestLogin,
  }) async {
    return await _loginUsecase.login(requestLogin: requestLogin);
  }
}
