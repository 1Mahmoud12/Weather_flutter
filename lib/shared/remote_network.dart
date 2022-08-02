import 'package:dio/dio.dart';


//  https://api.openweathermap.org/data/2.5/weather?id={city id}&appid={API key}

class DioHelper {
  static late Dio dio;
  static const String api='Enter Your api';
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://api.openweathermap.org/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response> getData(
      {
        String url='data/2.5/weather',
        Map<String, dynamic>? query,
        String apiKey = api,
        })
  async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }


}



