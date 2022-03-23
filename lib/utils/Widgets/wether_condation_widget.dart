import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

class WeatherCondationWidget extends StatelessWidget {

  final String cityName;
  WeatherCondationWidget({this.cityName = 'Gaza'});
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
              Container(
                width: SizeConfig.scaleWidth(64),
                height: SizeConfig.scaleHeight(64),
                child: Image.asset('images/icon/cloudy.png'),
              ),
              SizedBox(width: SizeConfig.scaleHeight(10)),
              Styles_App (
                text: '11',
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
                text: 'Precipitation: 73%',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                textColor: Colors.white,
              ),
              Styles_App(
                text: 'Humidity: 88%',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                textColor: Colors.white,
              ),
              Styles_App(
                text: 'Wind: 13 km/h',
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
                text: cityName,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                textColor: Colors.white,
              ),
              Styles_App(
                text: 'Sunday 11:00 PM',
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
