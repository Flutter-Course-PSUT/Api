import 'package:api/core/dependencies/api/api_dependency.dart';
import 'package:api/core/model/login/request_login.dart';
import 'package:api/core/model/login/response_login.dart';
import 'package:api/core/model_error/response_api_error.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginUsecase {
  Future<Either<ResponseApiError, ResponseLogin>> login({
    required RequestLogin requestLogin,
  }) async {
    try {
      final snapshot = await ApiDependency.instance.apiService.login(
        requestLogin: requestLogin,
      );

      return Right(snapshot);
    } on DioException catch (e) {
      return Left(ResponseApiError.fromJson(e.response?.data));
    }
  }
}
