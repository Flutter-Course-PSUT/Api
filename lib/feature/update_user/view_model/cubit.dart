import 'package:api/core/model/update_user/request_update_user.dart';
import 'package:api/core/model/user/response_user.dart';
import 'package:api/feature/update_user/repo/update_user_repo.dart';
import 'package:api/feature/update_user/view_model/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateuserInitState());
  final _updateUserRepo = UpdateUserRepo();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNunmberController = TextEditingController();
  final userNameController = TextEditingController();

  void init({required ResponseUser responseUser}) {
    emailController.text = responseUser.email ?? '';
    fullNameController.text = responseUser.fullName ?? '';
    phoneNunmberController.text = responseUser.phoneNumber ?? '';
    userNameController.text = responseUser.userName ?? '';
  }

  Future<void> updateUser() async {
    emit(UpdateuserLoadingState());
    final result = await _updateUserRepo.updateUser(
      requestUpdateUser: RequestUpdateUser(
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
        userName: userNameController.text,
        phoneNumber: phoneNunmberController.text,
      ),
    );

    result.fold(
      (responseApiError) {
        emit(UpdateuserErrorState(responseApiError: responseApiError));
      },
      (_) {
        emit(UpdateuserSucessState());
      },
    );
  }
}
