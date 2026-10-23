import 'package:api/core/model/user/response_user.dart';
import 'package:api/core/model_error/response_api_error.dart';
import 'package:api/core/usecase/user/user_usecase.dart';
import 'package:dartz/dartz.dart';

class UserRepo {
  final _userUsecase = UserUsecase();

  Future<Either<ResponseApiError, List<ResponseUser>>> getUser() async {
    return await _userUsecase.getUser();
  }

  Future<Either<ResponseApiError, ResponseUser>> getUserById({
    required String id,
  }) async {
    return await _userUsecase.getUserById(id: id);
  }

  Future<Either<ResponseApiError, bool>> deleteUser({
    required String id,
  }) async {
    return await _userUsecase.deleteUser(id: id);
  }
}
