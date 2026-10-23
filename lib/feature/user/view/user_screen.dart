import 'package:api/core/utils/widgets/loading/custom_loading.dart';
import 'package:api/feature/update_user/view/update_user_screen.dart';
import 'package:api/feature/user/view_model/cubit.dart';
import 'package:api/feature/user/view_model/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUser(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserDeleteLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is UserDeleteErrorState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.responseApiError.error ?? '',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            } else if (state is UserDeleteSuccessState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'User Delete Successfully',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<UserCubit>();
            if (state is UserLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserErrorState) {
              return Center(
                child: Text(state.responseApiError.description ?? ''),
              );
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    TextField(
                      onSubmitted: (value) {
                        cubit.getUserById(id: value);
                      },
                      decoration: InputDecoration(
                        hintText: 'User Id',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30),
                    state is UserSearchLoadingState
                        ? CircularProgressIndicator()
                        : Column(
                            spacing: 6,
                            children: [
                              Text(cubit.responseUserbyId?.email ?? ''),
                              Text(cubit.responseUserbyId?.fullName ?? ''),
                              Text(cubit.responseUserbyId?.userName ?? ''),
                            ],
                          ),
                    SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cubit.responseUser.length,
                      itemBuilder: (context, index) {
                        final userData = cubit.responseUser[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return UpdateUserScreen(
                                    responseUser: userData,
                                  );
                                },
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(userData.fullName ?? ''),
                            trailing: GestureDetector(
                              onTap: () {
                                cubit.deleteUser(id: userData.id ?? '');
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                            subtitle: Text(userData.email ?? ''),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
