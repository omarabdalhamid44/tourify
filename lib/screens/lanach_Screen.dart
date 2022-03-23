
import 'package:flutter/material.dart';
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
      Navigator.pushReplacementNamed(context, '/on_Bording_Screen');
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
        child: Image.asset('images/logo/logoTourify.png',width: 250,height: 230,)
      ),
    );
  }
}
