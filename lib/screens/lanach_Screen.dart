
// ignore_for_file: camel_case_types, file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:xdd/Storge/shared_prefernces.dart';
import 'package:xdd/screens/BnScreens/BnScreens.dart';
import 'package:xdd/screens/authScreens/login_Screen.dart';
import 'package:xdd/screens/on_bording_Screens/on_bording.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';

class Lanach_Screen extends StatefulWidget {
  const Lanach_Screen({Key? key}) : super(key: key);

  @override
  State<Lanach_Screen> createState() => _Lanach_ScreenState();
}

class _Lanach_ScreenState extends State<Lanach_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), (){

      Navigator.pushReplacement( context ,MaterialPageRoute(builder: (context)=> BnScreens()));
      SizeConfig.init(context);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors_APP.color_bg_lanach_sc,
      child: Center(
        child: Image.asset('images/logo/logo.png',width: 250,height: 230,color: Colors.white,)
      ),
    );
  }
}
