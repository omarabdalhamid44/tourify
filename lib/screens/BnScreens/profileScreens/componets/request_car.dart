import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/listOf_Thing.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';


class Reguest_Car extends StatefulWidget {
  const Reguest_Car({Key? key}) : super(key: key);

  @override
  State<Reguest_Car> createState() => _Reguest_CarState();
}

class _Reguest_CarState extends State<Reguest_Car> {
  DateTime? _dateTime;
  String time = '8:00 AM';
  String time1 = '8:00 AM';
  String? selectedItemDriver;
  String? selectedItemColor;
  String? selectedItemDelivery;
  String? selectedItemColorDeliveryPlace;
  String? selectedItemLicense;


  @override
  Widget build(BuildContext context) {
    Future<void> _openTimePicker(BuildContext context)async {
      final TimeOfDay? t =
          await showTimePicker(context: context, initialTime:TimeOfDay.now(),
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(
                    // change the border color
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    surface: Color(0xFF6F3CBD),
                  ),
                  // button colors
                  buttonTheme: ButtonThemeData(
                    colorScheme: ColorScheme.light(
                      primary:  Color(0xFF6F3CBD),
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );
      if (t != null ){
        setState(() {
          time = t.format(context);

        });
      }
    }
    Future<void> _openTimePicker1(BuildContext context)async {
      final TimeOfDay? t1 =
      await showTimePicker(context: context, initialTime:TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                // change the border color
                primary: Colors.white,
                onPrimary: Colors.black,
                surface: Color(0xFF6F3CBD),
              ),
              // button colors
              buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme.light(
                  primary:  Color(0xFF6F3CBD),
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (t1 != null ){
        setState(() {
          time1 = t1.format(context);

        });
      }
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors_APP.color_primary),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push( context, MaterialPageRoute(builder: (context) => FeverateScreen()));

            },
            icon: imageIcon.heartIcon,
            color: Colors_APP.color_primary,
          ),
          IconButton(
            onPressed: () {
              Navigator.push( context, MaterialPageRoute(builder: (context) => Notifications()));
            },
            icon: imageIcon.notifiIcon,
            color: Colors_APP.color_primary,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'car reservation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors_APP.color_primary,
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    height: 120,
                    // color: Colors.green,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 90,
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors_APP.color_primary,
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          left: -15,
                          right: 150,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            height: 114.0,
                            width: 192.0,
                            child: Image.asset(
                              'images/asset/hyndui.png',
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),


                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Styles_App(
                text: 'Choose With Or Without A Driver',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.scaleWidth(9)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  isExpanded: true,
                  alignment: Alignment.topLeft,
                  borderRadius: BorderRadius.circular(5),
                  underline: Text(''),
                  hint: Styles_App(text: 'Driver', fontWeight: FontWeight.w500,textColor: Colors.grey.shade300),
                  icon: Icon(Icons.keyboard_arrow_down_rounded,color: Colors_APP.color_primary,),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: SizeConfig.scaleTextFont(13),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  elevation: 0,
                  items: ListOfThings.list_of_Driver.map((String dropDownStringItemDriver) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.centerStart,
                      value: dropDownStringItemDriver,
                      child: Text(dropDownStringItemDriver),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      selectedItemDriver = newValueSelected!;
                    });
                  },
                  value: selectedItemDriver,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Styles_App(
                text: 'Car Color',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.scaleWidth(9)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  isExpanded: true,
                  alignment: Alignment.topLeft,
                  borderRadius: BorderRadius.circular(5),
                  underline: Text(''),
                  hint: Styles_App(text: 'Car Color', fontWeight: FontWeight.w500,textColor: Colors.grey.shade300),
                  icon: Icon(Icons.keyboard_arrow_down_rounded,color: Colors_APP.color_primary,),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: SizeConfig.scaleTextFont(13),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  elevation: 0,
                  items: ['White','Red','Black'].map((String dropDownStringItemColor) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.centerStart,
                      value: dropDownStringItemColor,
                      child: Text(dropDownStringItemColor),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      selectedItemColor = newValueSelected!;
                    });
                  },
                  value:selectedItemColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Styles_App(
                text: 'Booking Date',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  height: SizeConfig.scaleHeight(48),
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(10),
                      right: SizeConfig.scaleWidth(20)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Styles_App(
                            text: _dateTime == null
                                ? 'dd/mm/yyyy'
                                : _dateTime!.day.toString() +
                                '/' +
                                _dateTime!.month.toString() +
                                '/' +
                                _dateTime!.year.toString(),
                            fontWeight: FontWeight.w400,
                            textColor: _dateTime == null
                                ? Colors.grey
                                : Colors.black,
                          )),
                      SizedBox(width: SizeConfig.scaleWidth(160)),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1980),
                                  lastDate: DateTime(2030),
                                  initialDate: _dateTime == null
                                      ? DateTime.now()
                                      : _dateTime!,
                                  builder: (context, child) => Theme(
                                      data: ThemeData().copyWith(
                                        colorScheme: ColorScheme.dark(
                                          primary: Colors.white,
                                          onPrimary: Colors.black,
                                          surface: Color(0xFF6F3CBD),
                                        ),
                                        cardColor: Colors.black,
                                        dialogBackgroundColor:
                                        Color(0xFF6F3CBD),
                                      ),
                                      child: child!)).then((date) {
                                setState(() {
                                  _dateTime = date;
                                });
                              });
                            },
                            child: Icon(
                              Icons.date_range,
                              color: Colors_APP.color_primary,
                            )
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Styles_App(
                text: 'Stone Clock',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  height: SizeConfig.scaleHeight(48),
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(10),
                      right: SizeConfig.scaleWidth(20)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Styles_App(
                            text:time,
                            fontWeight: FontWeight.w400,
                            textColor: time == null
                                ? Colors.grey
                                : Colors.black,
                          )),
                      SizedBox(width: SizeConfig.scaleWidth(160)),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                            _openTimePicker(context);
                            },
                            child: Icon(
                              Icons.access_time_sharp,
                              color: Colors_APP.color_primary,
                            )
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: SizeConfig.scaleHeight(11)),
              Styles_App(
                text: 'Expected Duration',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  height: SizeConfig.scaleHeight(48),
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(10),
                      right: SizeConfig.scaleWidth(20)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Styles_App(
                            text:time1,
                            fontWeight: FontWeight.w400,
                            textColor: time1 == null
                                ? Colors.grey
                                : Colors.black,
                          )),
                      SizedBox(width: SizeConfig.scaleWidth(160)),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              _openTimePicker1(context);
                            },
                            child: Icon(
                              Icons.access_time_sharp,
                              color: Colors_APP.color_primary,
                            )
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Styles_App(
                text: 'Place Of Delivery',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.scaleWidth(9)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  isExpanded: true,
                  alignment: Alignment.topLeft,
                  borderRadius: BorderRadius.circular(5),
                  underline: Text(''),
                  hint: Styles_App(text: 'Gaza - Al-Rimal - Al-Shuhada Street', fontWeight: FontWeight.w500,textColor: Colors.grey.shade300),
                  icon: Icon(Icons.keyboard_arrow_down_rounded,color: Colors_APP.color_primary,),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: SizeConfig.scaleTextFont(13),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  elevation: 0,
                  items: ListOfThings.list_of_Driver.map((String dropDownStringItemPlaceofDelivery) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.centerStart,
                      value: dropDownStringItemPlaceofDelivery,
                      child: Text(dropDownStringItemPlaceofDelivery),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      selectedItemDelivery= newValueSelected!;
                    });
                  },
                  value: selectedItemDelivery,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Styles_App(
                text: 'Delivery Place',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.scaleWidth(9)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  isExpanded: true,
                  alignment: Alignment.topLeft,
                  borderRadius: BorderRadius.circular(5),
                  underline: Text(''),
                  hint: Styles_App(text: 'Gaza - Al-Rimal - Al-Shuhada Street', fontWeight: FontWeight.w500,textColor: Colors.grey.shade300),
                  icon: Icon(Icons.keyboard_arrow_down_rounded,color: Colors_APP.color_primary,),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: SizeConfig.scaleTextFont(13),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  elevation: 0,
                  items: ListOfThings.list_of_Driver.map((String dropDownStringItemDeliveryPlace) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.centerStart,
                      value: dropDownStringItemDeliveryPlace,
                      child: Text(dropDownStringItemDeliveryPlace),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      selectedItemColorDeliveryPlace = newValueSelected!;
                    });
                  },
                  value:selectedItemColorDeliveryPlace,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Styles_App(
                text: 'Driving License',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.scaleWidth(9)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  isExpanded: true,
                  alignment: Alignment.topLeft,
                  borderRadius: BorderRadius.circular(5),
                  underline: Text(''),
                  hint: Styles_App(text: 'Please attach  drivers license', fontWeight: FontWeight.w500,textColor: Colors.grey.shade300),
                  icon: Icon(Icons.arrow_circle_up,color: Colors_APP.color_primary,),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: SizeConfig.scaleTextFont(13),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  elevation: 0,
                  items: ListOfThings.list_of_Driver.map((String dropDownStringItemDeliveryPlace) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.centerStart,
                      value: dropDownStringItemDeliveryPlace,
                      child: Text(dropDownStringItemDeliveryPlace),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                     selectedItemLicense = newValueSelected!;
                    });
                  },
                  value: selectedItemLicense,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Car Reservation',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    primary: Colors_APP.color_primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
