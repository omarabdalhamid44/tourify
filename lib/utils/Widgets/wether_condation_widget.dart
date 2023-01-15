// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

class WeatherCondationWidget extends StatefulWidget {

  final String cityName;
  final String degree;
  final String precipitation;
  final String humidity;
  final String wind;

  WeatherCondationWidget({this.cityName = 'Gaza',this.degree='20', this.precipitation='66%', this.humidity='80', this.wind='13 km/h'});

  @override
  State<WeatherCondationWidget> createState() => _WeatherCondationWidgetState();
}

class _WeatherCondationWidgetState extends State<WeatherCondationWidget> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: SizeConfig.scaleHeight(90),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors_APP.color_primary2),
        ),
        Positioned(
          left: SizeConfig.scaleWidth(5),
          bottom: SizeConfig.scaleHeight(5),
          right: SizeConfig.scaleWidth(240),
          top: SizeConfig.scaleHeight(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeConfig.scaleWidth(64),
                height: SizeConfig.scaleHeight(64),
                child: Image.asset('images/icon/cloudy.png'),
              ),
              SizedBox(width: SizeConfig.scaleHeight(5)),
              Styles_App (
                text: widget.degree,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
        Positioned(
            left: SizeConfig.scaleWidth(95),
            bottom: SizeConfig.scaleHeight(35),
            right: SizeConfig.scaleWidth(216),
            top: SizeConfig.scaleHeight(16),
            child: Styles_App(
              text: '°C°F',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              textColor: Colors.white,
            )),
        SizedBox(width: 10),
        Positioned(

          left: SizeConfig.scaleWidth(138),
          bottom: SizeConfig.scaleHeight(5),
          right: SizeConfig.scaleWidth(132),
          top: SizeConfig.scaleHeight(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles_App(
                text: 'Precipitation: ${widget.precipitation}',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                textColor: Colors.white,
              ),
              Styles_App(
                text: 'Humidity: ${widget.humidity}',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                textColor: Colors.white,
              ),
              Styles_App(
                text: 'Wind: ${widget.wind}',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                textColor: Colors.white,
              )
            ],
          ),
        ),
        Positioned(

          left: SizeConfig.scaleWidth(250),
          bottom: SizeConfig.scaleHeight(5),
          right: SizeConfig.scaleWidth(11),
          top: SizeConfig.scaleHeight(9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles_App(
                text: widget.cityName,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                textColor: Colors.white,
              ),
              Styles_App(
                text: 'Monday ${dateTime.hour}:${dateTime.minute} PM',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                textColor: Colors.white,
              ),
              Styles_App(
                text: 'Mostly cloudy',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                textColor: Colors.white,
              )
            ],
          ),
        )
      ],
    );
  }
}
