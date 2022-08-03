import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: "https://accept.paymob.com/api/",
          receiveDataWhenStatusError: true),
    );
  }

  static Future getData({required url, query}) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future postData({required url, query, data}) async {
    return await dio!.post(url, queryParameters: query, data: data);
  }
}
