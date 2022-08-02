

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_task/layout/cubit/states.dart';
import 'package:note_task/layout/cubit/weather_cubit.dart';
import 'package:note_task/layout/logo_weather.dart';
import 'package:note_task/shared/MyBlocObserver.dart';
import 'package:note_task/shared/remote/local/cash_helper.dart';
import 'package:note_task/shared/remote_network.dart';

import 'layout/internet_check.dart';
import 'layout/weather_layout.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  String? city;
  if(CashHelper.get('city')=='') {
    city='egypt';
  } else{
    city=CashHelper.get('city');
  }
  //print(city);
  BlocOverrides.runZoned(
        () {
          runApp( MyApp(city: city,));
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  final String? city;
  bool isCheck=false;
     MyApp({Key? key,required this.city}) : super(key: key);
    Widget? startWidget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>WeatherCubit()..uploadApi(city),
      child: BlocConsumer<WeatherCubit,WeatherStates>(
             listener: (context,state){
                    if(state is WeatherInitialStates) {
                      startWidget=const LogoWeather();
                    }  else if(state is WeatherErrorStates)
                    {startWidget=InternetCheck(city: city,);
                        }
                    else{
                      startWidget=WeatherLayout(city: city);
                      //showToast(text: 'InternetConnection Error', state:ToastStates.WARNING);
                    }
             },
             builder: (context,state)  {


               return MaterialApp(
                 debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                  primarySwatch: Colors.blue,

              ),
                  home: startWidget,
        );
             },
           )
        ,

    );
  }
}

