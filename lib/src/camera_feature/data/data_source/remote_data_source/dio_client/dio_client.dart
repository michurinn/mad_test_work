import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient({required this.dio}){
    dio.options.baseUrl = 'https://json-parser.com';  
    dio.options.connectTimeout = const Duration(milliseconds: 15100);
    dio.options.receiveTimeout = const Duration(milliseconds: 15100);
  }

  Future<Response> get(String path) async {
    return await dio.get(path);
  }
  
}