
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_task/layout/cubit/states.dart';
import 'package:note_task/layout/cubit/weather_cubit.dart';
import 'package:note_task/layout/search_temperature.dart';



import '../shared/constants/constants.dart';


class WeatherLayout extends StatelessWidget {
    final String? city;
  const WeatherLayout({Key? key,this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit,WeatherStates>(
          builder: (context,state){
            var model =WeatherCubit.get(context);
            //var weatherModel =  WeatherCubit.get(context).model;

            if(state is WeatherSuccessStates) {
               return Scaffold(

                appBar: AppBar(
                  leading: IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchTemperature()));
                  }, icon: const Icon(Icons.search)),
                  actions: [
                    IconButton(onPressed: (){

                      model.checkInternet(context);
                      model.locationNow();

                    }, icon: const Icon(Icons.my_location)),
                  ],

                ),
                body: Stack(

                  alignment: AlignmentDirectional.center,
                  children: [
                    Column(
                      children:  const[
                        Expanded(
                          child: Image(fit: BoxFit.cover,
                              image:
                              NetworkImage('https://img.freepik.com/free-photo/closeup-shot-thermometer-beach-sand_181624-12367.jpg?size=626&ext=jpg&uid=R75154930')),

                        ),

                      ],
                    ),
                    Text('${WeatherCubit.get(context).cityByLocation??'--'} \n\n\n\n\n\n\n',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
                    Text('$nameDayNow \n\n\n\n',style: const TextStyle(fontSize: 50),),
                    Text('\n\n\n\n\n${WeatherCubit.get(context).description??'--'}\n\n\n\n',style: const TextStyle(fontSize: 50),),
                    Text('\n\n\n\n\n\n\n\n\n\t ${WeatherCubit.get(context).tempNow??'--'} \n\n\n\n',style: const TextStyle(fontSize: 50),) ,
                    const SizedBox(height: 50,),
                    Row(

                      children:  [
                        Text('\n\n\n\n\n\n\n\n\n\n\t\t\t\t\t\t\t ${WeatherCubit.get(context).tempMin??'--'}\t\t\t',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 45)),
                        Text('\n\n\n\n\n\n\n\n\n\n\t\t\t   ${WeatherCubit.get(context).tempMax??"--"}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 45),),
                      ],),
                  ],
                ),
              );
            }
            else
            {
              return const Center(child: CircularProgressIndicator(),);
            }

          },

        );

  }
}
