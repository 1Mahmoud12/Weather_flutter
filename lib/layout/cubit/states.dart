import 'package:note_task/models/model_weather.dart';

abstract class WeatherStates{}
class WeatherInitialStates extends WeatherStates{}
class WeatherLoadingStates extends WeatherStates{}
class WeatherSuccessStates extends WeatherStates{
  final WeatherModel? model;

  WeatherSuccessStates({this.model});
}
class WeatherErrorStates extends WeatherStates{
   final dynamic error;

  WeatherErrorStates(this.error);
}

class WeatherSearchSuccessStates extends WeatherStates{}
class WeatherSearchErrorStates extends WeatherStates{
  final dynamic error;

  WeatherSearchErrorStates(this.error);
}

// location

class WeatherLocationSuccessStates extends WeatherStates{}
class WeatherLocationLoadingStates extends WeatherStates{}
class WeatherLocationErrorStates extends WeatherStates{
  final  dynamic error;

  WeatherLocationErrorStates(this.error);
}

// check internet

class WeatherInternetCheckLoadingStates extends WeatherStates{}
class WeatherInternetCheckSuccessStates extends WeatherStates{}
class WeatherInternetCheckErrorStates extends WeatherStates{}

class WeatherTimerCheckSuccessStates extends WeatherStates{}
class WeatherHomeCheckSuccessStates extends WeatherStates{}
