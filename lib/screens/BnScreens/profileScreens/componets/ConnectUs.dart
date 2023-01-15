import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';
import 'package:xdd/utils/sizeconfig.dart';


class ConnectUs extends StatelessWidget {
  const ConnectUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Styles_App(
                  text: 'Connect Us'.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 250,
                  height: 130,
                  color: Colors.transparent,
                  child: Image.asset('images/asset/contact.png'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Styles_App(
                      text: 'First Name',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Styles_App(
                      text: 'Last Name',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Row(
                children: [
                  Expanded(
                      child: textField_app(
                  )),
                  SizedBox(width: SizeConfig.scaleWidth(10)),
                  Expanded(
                      child: textField_app(
                  )),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Styles_App(
                text: 'E-mail',
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
              SizedBox(height: SizeConfig.scaleHeight(9)),
              textField_app(
                hint: 'Enter your Email ...',
              ),
              SizedBox(height: SizeConfig.scaleHeight(9)),
              Styles_App(
                text: 'Message',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(9)),
              textField_app(
                hint: 'Write The Message',
                maxline: 10,
              ),
              SizedBox(height: SizeConfig.scaleHeight(30)),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Send Message',
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
              SizedBox(height: SizeConfig.scaleHeight(20)),

            ]),
          ),
        ));
  }
}
