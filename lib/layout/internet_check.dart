
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_task/layout/cubit/states.dart';
import 'package:note_task/layout/cubit/weather_cubit.dart';

class InternetCheck extends StatelessWidget {
  final String? city;
  const InternetCheck({Key? key,required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit,WeatherStates>(
      builder: (context,state)=> Center(
          child: AlertDialog(
            title: const Text('Notification'),
            content: const Text('Please check Your Internet'),
            actions: [
              TextButton(
                  onPressed: () {
                    WeatherCubit.get(context).uploadApi(city);
                  },
                  child: const Text('okay'))
            ],
          )),
    );
  }
}
