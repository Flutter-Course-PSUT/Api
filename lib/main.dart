import 'package:api/core/dependencies/main/main_dependency.dart';
import 'package:api/feature/login/view/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  MainDependency.mainInitDependency();
  runApp(const ApiApp());
}

class ApiApp extends StatelessWidget {
  const ApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}
