import 'package:flutter/material.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

class Helpers{
 static void showSnackBar(BuildContext context,String mass,{bool error = false}){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Styles_App(text:mass,fontWeight: FontWeight.w500,textColor: Colors.white),
backgroundColor: error ? Colors.red  : Colors.green,duration: Duration(seconds: 2),),
);
}
}