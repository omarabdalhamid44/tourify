import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/listOf_Thing.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';


class Car_Reservation extends StatefulWidget {
  const Car_Reservation({Key? key}) : super(key: key);

  @override
  State<Car_Reservation> createState() => _Car_ReservationState();
}

class _Car_ReservationState extends State<Car_Reservation> {
  DateTime? _dateTime;
  String time = '8:00 AM';
  String time1 = '8:00 AM';
  String? selectedItemDriver;
  String? selectedItemVehicle;

  String? selectedItemAddress;

  @override
  Widget build(BuildContext context) {
    Future<void> _openTimePicker(BuildContext context) async {
      final TimeOfDay? t = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
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
      if (t != null) {
        setState(() {
          time = t.format(context);
        });
      }
    }

    Future<void> _openTimePicker1(BuildContext context) async {
      final TimeOfDay? t1 = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
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
      if (t1 != null) {
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
                'Order a Taxi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors_APP.color_primary,
                ),
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
                  hint: Styles_App(
                      text: 'Driver',
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey.shade300),
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: SizeConfig.scaleTextFont(13),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  elevation: 0,
                  items: ListOfThings.list_of_Driver
                      .map((String dropDownStringItemDriver) {
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
                text: 'Vehicle Type',
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
                  hint: Styles_App(
                      text: 'Vehicle Type',
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey.shade300),
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: SizeConfig.scaleTextFont(13),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  elevation: 0,
                  items: ['Kia','BMW','Marceds']
                      .map((String dropDownStringItemVehicle) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.centerStart,
                      value: dropDownStringItemVehicle,
                      child: Text(dropDownStringItemVehicle),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      selectedItemVehicle = newValueSelected!;
                    });
                  },
                  value: selectedItemVehicle,
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
                            textColor:
                                _dateTime == null ? Colors.grey : Colors.black,
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
                            )),
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
                            text: time,
                            fontWeight: FontWeight.w400,
                            textColor:
                                time == null ? Colors.grey : Colors.black,
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
                            )),
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
                            text: time1,
                            fontWeight: FontWeight.w400,
                            textColor:
                                time1 == null ? Colors.grey : Colors.black,
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
                            )),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Styles_App(
                text: 'Address',
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
                  hint: Styles_App(
                      text: 'Address',
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey.shade300),
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: SizeConfig.scaleTextFont(13),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  elevation: 0,
                  items: ['']
                      .map((String dropDownStringItemAddress) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.centerStart,
                      value: dropDownStringItemAddress,
                      child: Text(dropDownStringItemAddress),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      selectedItemAddress = newValueSelected!;
                    });
                  },
                  value: selectedItemAddress,
                ),
              ),
              SizedBox(
                height: 10,
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
