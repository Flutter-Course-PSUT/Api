import 'package:api/core/dependencies/api/api_dependency.dart';

class MainDependency {
  static void mainInitDependency() {
    ApiDependency.instance.apiInitDependency();
  }
}
