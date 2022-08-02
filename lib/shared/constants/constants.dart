
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

var nameDayNow=DateFormat('EEEE').format(DateTime.now());
void navigatorReuse(context,widget)
=> Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));

Future<void> showToast({@required String? text,@required ToastStates? state })
{
  return Fluttertoast.showToast(
      msg: text!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: chooseColor(state!),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastStates{SUCCESS,WARNING,ERROR}

Color chooseColor(ToastStates state)
{
  if(state==ToastStates.SUCCESS){return Colors.green;}
  else if(state==ToastStates.WARNING) {return Colors.amber;}
  else  {return Colors.red;}

}