// ignore_for_file: camel_case_types, file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';

class Styles_App extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color textColor;
  Styles_App({
    required this.text,
    required this.fontWeight,
    this.fontSize = 15,
    this.textColor = Colors_APP.color_primary});


  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontFamily: 'Poppins' ,
          fontWeight: fontWeight ,
          fontSize: SizeConfig.scaleTextFont(fontSize),
        color: textColor,
      ),);
  }
}

