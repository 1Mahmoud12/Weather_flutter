

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_task/layout/cubit/states.dart';
import 'package:note_task/layout/cubit/weather_cubit.dart';

class LogoWeather extends StatelessWidget {
  const LogoWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener:(context,state){

      }  ,
      builder: (context,state) {
       // WeatherCubit.get(context).checkInternet(context);
        return Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                 Expanded(
                  child: Image.asset('assets/sun-cloud-logo_126523-811.webp',fit: BoxFit.cover,)
                ),
              ],
             ),

            const Text('\n\n\n\n\nFrom\n',style: TextStyle(fontSize: 30),),
            const Text( 'Mahmoud Medhat',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
          ],
        ),
      );

      },
    );

  }

}
