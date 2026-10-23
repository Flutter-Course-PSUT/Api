import 'package:dio/dio.dart';

class DioDependency {
  static DioDependency? _instance;

  DioDependency._init() {
    _instance = this;
  }

  static DioDependency get instance {
    if (_instance == null) {
      DioDependency._init();
    }
    return _instance!;
  }

  final _dio = Dio();
  Dio get dio => _dio;
}
