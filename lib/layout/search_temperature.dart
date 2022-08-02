
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_task/layout/cubit/states.dart';
import 'package:note_task/layout/cubit/weather_cubit.dart';

class SearchTemperature extends StatelessWidget {
   SearchTemperature({Key? key}) : super(key: key);
  var textController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
       BlocConsumer<WeatherCubit,WeatherStates>(
      listener: (context,state){},
        builder: (context,state) {
          return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.white70,
                      borderRadius: BorderRadiusDirectional.circular(15)
                    ),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 20,),
                      controller:textController ,
                      //textAlign:TextAlign.center ,
                      onFieldSubmitted: (String s){
                        WeatherCubit.get(context).searchApi(s);
                      },

                      decoration: const InputDecoration(
                         focusColor: Colors.white,
                        border:OutlineInputBorder( ),
                        hintText: 'which country you want',

                        prefix: Icon(Icons.location_on,color: Colors.black,size: 18,)

                      ),

                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: TextButton(onPressed: (){WeatherCubit.get(context).searchApi(textController.text);},child: const Text('SEARCH')),),
                    if(WeatherCubit.get(context).searchTempNow!=null)
                    Expanded(child: TextButton(onPressed: (){ WeatherCubit.get(context).uploadApi(WeatherCubit.get(context).searchCityName);Navigator.pop(context); },
                        child: const Text('set as default'))),
                  ],
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left:  50,),
                  child: Row(
                    children:const [
                    Expanded(child: Text('Now',style: TextStyle(color: Colors.white,fontSize: 30),)),
                    Expanded(child: Text('Min',style: TextStyle(color: Colors.white,fontSize: 30),),),
                    Expanded(child: Text('Max',style: TextStyle(color: Colors.white,fontSize: 30),)),

                  ],),
                ),
                const SizedBox(height: 20,),
                if(WeatherCubit.get(context).searchTempNow!=null)
                Padding(
                  padding: const EdgeInsets.only(left:  50,),
                  child: Row(
                    children: [
                      Expanded(child: Text(WeatherCubit.get(context).searchTempNow.toString(),style: const TextStyle(color: Colors.white,fontSize: 30),)),
                      Expanded(child: Text(WeatherCubit.get(context).searchTempMin.toString(),style: const TextStyle(color: Colors.white,fontSize: 30),),),
                      Expanded(child: Text(WeatherCubit.get(context).searchTempMax.toString(),style: const TextStyle(color: Colors.white,fontSize: 30),)),

                    ],),
                ),
                if(WeatherCubit.get(context).searchTempNow!=null)
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          WeatherCubit.get(context).searchDescription.toString(),
                          style:
                              const TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                )
                ],
            ),
          ),
        );
        },

    );
  }
}
