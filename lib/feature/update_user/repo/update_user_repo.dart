import 'package:api/core/model/update_user/request_update_user.dart';
import 'package:api/core/model_error/response_api_error.dart';
import 'package:api/core/usecase/user/user_usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateUserRepo {
  final _userUsecase = UserUsecase();

  Future<Either<ResponseApiError, bool>> updateUser({
    required RequestUpdateUser requestUpdateUser,
  }) async {
    return await _userUsecase.updateUser(requestUpdateUser: requestUpdateUser);
  }
}
