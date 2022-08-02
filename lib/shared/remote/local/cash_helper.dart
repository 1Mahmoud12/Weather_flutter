


import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{
  static late SharedPreferences shared;

  static init()async
  {
    shared = await SharedPreferences.getInstance();
  }

  static Future putData({required String key,required String value})async
  {
      return await shared.setString(key, value);
  }

  static dynamic get( key)
  {
    return shared.get(key);
  }

}