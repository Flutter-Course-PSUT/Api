import 'package:api/core/model/user/response_user.dart';
import 'package:api/feature/user/repo/user_repo.dart';
import 'package:api/feature/user/view_model/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitState());
  final _userRepo = UserRepo();

  final List<ResponseUser> responseUser = [];
  ResponseUser? responseUserbyId;

  Future<void> getUser() async {
    emit(UserLoadingState());
    final result = await _userRepo.getUser();
    result.fold(
      (responseApiError) {
        emit(UserErrorState(responseApiError: responseApiError));
      },
      (responseUser) {
        this.responseUser.addAll(responseUser);
        emit(UserSuccessState());
      },
    );
  }

  Future<void> deleteUser({required String id}) async {
    emit(UserDeleteLoadingState());
    final result = await _userRepo.deleteUser(id: id);
    result.fold(
      (responseApiError) {
        emit(UserDeleteErrorState(responseApiError: responseApiError));
      },
      (_) {
        responseUser.removeWhere((user) => user.id == id);
        emit(UserDeleteSuccessState());
      },
    );
  }

  Future<void> getUserById({required String id}) async {
    emit(UserSearchLoadingState());
    final result = await _userRepo.getUserById(id: id);
    result.fold(
      (responseApiError) {
        emit(UserSearchErrorState(responseApiError: responseApiError));
      },
      (responseUser) {
        responseUserbyId = responseUser;
        emit(UserSearchSuccessState());
      },
    );
  }
}
