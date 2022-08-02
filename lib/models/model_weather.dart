class WeatherModel
{


  Temperature? main;
  Description? description;
  String? cityName;
  WeatherModel.fromJson(Map<String,dynamic>json){
    cityName = json['name'];
    main=Temperature.fromJson(json['main']);
    description = Description.fromJson(json["weather"]);
  }
}

class Temperature
{
  dynamic tempMin;
  dynamic tempMax;
  dynamic tempNow;
  Temperature.fromJson(Map<String,dynamic>json){
    tempMin = json['temp_min'].round() - 275;
    tempMax = json['temp_max'].round() - 275;
    tempNow = json['temp'].round() - 275;
  }
}

class Description
{
  dynamic description;
  Description.fromJson(Map<String,dynamic>json){
    description=json[0]['description'];
  }
}