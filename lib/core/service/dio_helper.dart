import 'package:dio/dio.dart';

import '../Constant/strings.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: Strings.baseUrl,
        headers: {'Content-Type': 'application/json'}));
  }
}
