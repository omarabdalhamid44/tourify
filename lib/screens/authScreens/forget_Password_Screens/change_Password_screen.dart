
import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(50), horizontal: SizeConfig.scaleWidth(27)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Styles_App(
                text: 'Enter the code sent to you',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              SizedBox(height: SizeConfig.scaleHeight(25)),
              Image.asset(
                'images/forget_Sc.png',
                height: SizeConfig.scaleHeight(140),
                width: SizeConfig.scaleWidth(310),
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              Center(
                  child: Styles_App(
                    text: 'Please enter New Password',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    textColor: Colors.black,
                  )),
              SizedBox(height: SizeConfig.scaleHeight(20)),
                  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles_App(
                text: 'Password',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              textField_app(
                hint: 'Enter New password ... ',
                sucarity: true,
              ),
              SizedBox(height: SizeConfig.scaleHeight(11)),
              Styles_App(
                text: 'Password Confirmation',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              textField_app(
                hint: 'Enter Password Confirmation ... ',
                sucarity: true,
              ),
              SizedBox(height: SizeConfig.scaleHeight(11)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/Login_Screen');
                },
                child: Styles_App(
                  text: 'Change Password',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  textColor: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, SizeConfig.scaleHeight(50)),
                    primary: Colors_APP.color_primary),
              ),
            ],
          )])),
        ));
  }
}
