import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static void showDialogLoading({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 15),
              Text(
                'Please wait...',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      },
    );
  }
}
