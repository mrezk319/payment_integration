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

  Future getData({required url, query}) async {
    return await dio!.get(url, queryParameters: query);
  }

  Future postData({required url, query, data}) async {
    return await dio!.post(url, queryParameters: query, data: data);
  }
}
