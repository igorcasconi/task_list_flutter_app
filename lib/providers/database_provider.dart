import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task_list_flutter_app/providers/database_interceptors.dart';

class DatabaseProvider {
  final _dio = Dio();

  Dio get dio => _dio;

  DatabaseProvider() {
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("API_URL");
    _dio.interceptors.add(DatabaseInterceptors());
  }
}
