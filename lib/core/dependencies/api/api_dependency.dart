import 'package:api/core/api/api_service.dart';
import 'package:api/core/dependencies/dio/dio_dependency.dart';

class ApiDependency {
  static ApiDependency? _instance;

  ApiDependency._init() {
    _instance = this;
  }

  static ApiDependency get instance {
    if (_instance == null) {
      ApiDependency._init();
    }
    return _instance!;
  }

  late ApiService apiService;

  void apiInitDependency() {
    apiService = ApiService(DioDependency.instance.dio);
  }
}
