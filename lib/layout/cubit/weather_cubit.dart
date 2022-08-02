


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_check/internet_check.dart';
import 'package:location/location.dart';
import 'package:note_task/layout/cubit/states.dart';

import 'package:note_task/shared/constants/constants.dart';
import 'package:note_task/shared/remote/local/cash_helper.dart';
import 'package:note_task/shared/remote_network.dart';


class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit({Key? key}) : super(WeatherInitialStates());

  static WeatherCubit get(context) => BlocProvider.of(context);
  static const String api='Enter your Api here';

  static bool isOnline=  false;

  dynamic tempMin;
  dynamic tempMax;
  dynamic tempNow;
  dynamic lon;
  dynamic lat;
  String? description;
  String? cityByLocation;

  uploadApi(String? cityName) {
    emit(WeatherLoadingStates());
    CashHelper.putData(key: 'city', value: cityName!);
    DioHelper.getData(
        query: {
          'q': cityName,
          'appid': api}    )
        .then((value) {
          emit(WeatherSuccessStates());
      cityByLocation=value.data['name'];
      tempMin=value.data['main']['temp_min'].round()-275;
      tempMax=value.data['main']['temp_max'].round()-275;
      tempNow=value.data['main']['temp'].round()-275;
      description=value.data['weather'][0]['description'];

    }).catchError((onError) {
      emit(WeatherErrorStates(onError.toString()));

    });
  }



  late LocationData locationData;

  locationNow() async {
    emit(WeatherLocationLoadingStates());
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
   

      DioHelper.getData(
          query: {
            'lat': locationData.latitude,
            'lon': locationData.longitude,
            'appid': '21a26d6b73cfe422e203a063b8e124f9'}
      ).then((value) {
        //print(value.data['name'].toString());
        cityByLocation = value.data['name'];
        emit(WeatherLocationSuccessStates());
        uploadApi(cityByLocation!);

      }).catchError((error){
        //print(error.toString());
      });
    

  }

  String? searchCityName;
  dynamic searchTempMin;
  dynamic searchTempMax;
  dynamic searchTempNow;
  dynamic searchDescription;

  searchApi(String? search) {
    DioHelper.getData(
        query: {
          'q': search,
          'appid': '21a26d6b73cfe422e203a063b8e124f9'}
    ).then((value) {

      searchCityName = value.data['name'];
      searchTempMin = value.data['main']['temp_min'].round() - 275;
      searchTempMax = value.data['main']['temp_max'].round() - 275;
      searchTempNow = value.data['main']['temp'].round() - 275;
      searchDescription = value.data["weather"][0]['description'];
      //uploadApi(searchCityName);
      emit(WeatherSearchSuccessStates());
    }).catchError((onError) {
      showToast(text:'please write correct city' , state: ToastStates.WARNING);
      emit(WeatherSearchErrorStates(onError.toString()));
      // print(onError);
    });
  }

  checkInternet(context) async
  {
    emit(WeatherInternetCheckLoadingStates());

    if (!await Internet().check()) {
      //emit(WeatherInternetCheckErrorStates());

      Navigator.pushNamed(context, 'InternetCheck');
      //print(isOnline);
    }else{
      isOnline=true;
    }
    }

  }



