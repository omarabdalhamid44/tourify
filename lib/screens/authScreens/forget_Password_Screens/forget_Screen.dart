import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';

class Forget_Password_Screen extends StatefulWidget {
  const Forget_Password_Screen({Key? key}) : super(key: key);

  @override
  _Forget_Password_ScreenState createState() => _Forget_Password_ScreenState();
}

class _Forget_Password_ScreenState extends State<Forget_Password_Screen> {
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pushNamed(context, '/Regestration_Screen');
      };
  }

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
        backgroundColor: Color(0xFFF8F8F8),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.scaleHeight(50),
                horizontal: SizeConfig.scaleWidth(27)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles_App(
                  text: 'Forgot Password',
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
                Styles_App(
                  text: 'Username Or E-Mail',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                SizedBox(height: SizeConfig.scaleHeight(9)),
                textField_app(
                  hint: 'Enter your UserName or Email ...',
                ),
                SizedBox(height: SizeConfig.scaleHeight(20)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Code_verifaction_Screen');
                  },
                  child: Styles_App(
                    text: 'Send',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    textColor: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, SizeConfig.scaleHeight(50)),
                      primary: Colors_APP.color_primary),
                ),
              ],
            ),
          ),
        ));
  }
}
