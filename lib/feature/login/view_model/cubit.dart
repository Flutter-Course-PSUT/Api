import 'package:api/core/model/login/request_login.dart';
import 'package:api/feature/login/repo/login_repo.dart';
import 'package:api/feature/login/view_model/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());
  final _loginRepo = LoginRepo();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoadingState());
    final result = await _loginRepo.login(
      requestLogin: RequestLogin(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (responseApiError) {
        emit(LoginErrorState(responseApiError: responseApiError));
      },
      (responseLogin) {
        emit(LoginSuccessState());
      },
    );
  }
}
