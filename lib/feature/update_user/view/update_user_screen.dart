import 'package:api/core/model/user/response_user.dart';
import 'package:api/core/utils/widgets/loading/custom_loading.dart';
import 'package:api/feature/update_user/view_model/cubit.dart';
import 'package:api/feature/update_user/view_model/state.dart';
import 'package:api/feature/user/view/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserScreen extends StatelessWidget {
  const UpdateUserScreen({super.key, required this.responseUser});
  final ResponseUser responseUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateUserCubit()..init(responseUser: responseUser),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        body: BlocListener<UpdateUserCubit, UpdateUserState>(
          listener: (context, state) {
            if (state is UpdateuserLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is UpdateuserErrorState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.responseApiError.error ?? '',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            } else if (state is UpdateuserSucessState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return UserScreen();
                  },
                ),
                (route) => false,
              );
            }
          },
          child: Builder(
            builder: (context) {
              final cubit = context.read<UpdateUserCubit>();
              return SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: cubit.emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: cubit.fullNameController,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: cubit.userNameController,
                          decoration: InputDecoration(
                            hintText: 'User Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: cubit.phoneNunmberController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            cubit.updateUser();
                          },
                          child: Text('Update User'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
