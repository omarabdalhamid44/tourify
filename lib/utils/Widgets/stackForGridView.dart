// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, use_key_in_widget_constructors, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

class stackForGridView extends StatelessWidget {
  ImageProvider imageName;

  String cityName;
  String rate;

  stackForGridView(
      {required this.imageName,
      required this.cityName,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors_APP.colorContainar_of_stack,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 3), blurRadius: 6, color: Colors.black38)
              ]),
        ),
        Column(
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: Image(
                  image: imageName,
                  width: double.infinity,
                  height: SizeConfig.scaleHeight(120),
                  fit: BoxFit.fill,
                )),
            SizedBox(height: 7),
            Styles_App(
              text: cityName,
              fontWeight: FontWeight.w600,
              fontSize: 17,
              textColor: Colors_APP.color_primary,
            ),
            SizedBox(height: 3),

            Center(
              child: Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 40,
                  width: 200,
                  child: rate == '1'
                      ? Row(
                    children: [
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                    ],
                  )
                      : rate == '2'
                      ? Row(
                    children: [
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                    ],
                  )
                      : rate == '3'
                      ? Row(
                    children: [
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                    ],
                  )
                      : rate == '4'
                      ? Row(
                    children: [
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                    ],
                  )
                      : Row(
                    children: [
                      Icon(FlutterIcons.star_o_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.amberAccent),
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
