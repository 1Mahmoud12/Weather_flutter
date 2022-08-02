import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


//  https://api.openweathermap.org/data/2.5/weather?id={city id}&appid={API key}

class DioHelper {
  static late Dio dio;

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
        String apiKey = '21a26d6b73cfe422e203a063b8e124f9',
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

  static Future<Response> postData(
      {@required String? url,
        Map<String, dynamic>? query,
        Map<String, dynamic>? data,
        String lang = 'en',
        String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.post(url!, data: data, queryParameters: query);
  }

  static Future<Response> putData(
      {@required String? url,
        Map<String, dynamic>? query,
        Map<String, dynamic>? data,
        String lang = 'en',
        String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return dio.put(url!, data: data, queryParameters: query);
  }
}

// -{https://student.valuxapps.com/api/


// {"coord":{"lon":145.7667,"lat":-16.9167},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}],"base":"stations","main":{"temp":297.12,"feels_like":296.96,"temp_min":297.12,"temp_max":299.3,"pressure":1014,"humidity":53},"visibility":10000,"wind":{"speed":7.72,"deg":140},"clouds":{"all":15},"dt":1659075616,"sys":{"type":1,"id":9490,"country":"AU","sunrise":1659041008,"sunset":1659081788},"timezone":36000,"id":2172797,"name":"Cairns","cod":200}