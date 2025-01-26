import 'package:dio/dio.dart';
import 'package:newsapp/shared/constants.dart';

class Diohelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(baseUrl: baseurl, receiveDataWhenStatusError: true));
  }

  static Future<Response> getdata({required url, required query})async {
   return await dio.get(url, queryParameters: query);
  }
}
