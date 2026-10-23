import 'package:api/core/dependencies/api/api_dependency.dart';
import 'package:api/core/model/update_user/request_update_user.dart';
import 'package:api/core/model/user/response_user.dart';
import 'package:api/core/model_error/response_api_error.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserUsecase {
  Future<Either<ResponseApiError, List<ResponseUser>>> getUser() async {
    try {
      final snapshot = await ApiDependency.instance.apiService.getUser();
      return Right(snapshot);
    } on DioException catch (e) {
      return Left(ResponseApiError.fromJson(e.response?.data));
    }
  }

  Future<Either<ResponseApiError, ResponseUser>> getUserById({
    required String id,
  }) async {
    try {
      final snapshot = await ApiDependency.instance.apiService.getUserById(
        id: id,
      );

      return Right(snapshot);
    } on DioException catch (e) {
      return Left(ResponseApiError.fromJson(e.response?.data));
    }
  }

  Future<Either<ResponseApiError, bool>> updateUser({
    required RequestUpdateUser requestUpdateUser,
  }) async {
    try {
      final snapshot = await ApiDependency.instance.apiService.updateUser(
        requestUpdateUser: requestUpdateUser,
      );
      return Right(snapshot);
    } on DioException catch (e) {
      return Left(ResponseApiError.fromJson(e.response?.data));
    }
  }

  Future<Either<ResponseApiError, bool>> deleteUser({
    required String id,
  }) async {
    try {
      final snapshot = await ApiDependency.instance.apiService.deleteUser(
        id: id,
      );
      return Right(snapshot);
    } on DioException catch (e) {
      return Left(ResponseApiError.fromJson(e.response?.data));
    }
  }
}
