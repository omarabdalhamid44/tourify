import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';


class Delivery extends StatelessWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles_App(
                  text: 'Delivery'.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              SizedBox(height: 10,),
              Styles_App(
                text: 'Screen Will Be Unlocked Soon',
                fontWeight: FontWeight.normal,
                fontSize: 15,
                textColor: Colors.black,
              ),
              SizedBox(
                height:80,
              ),
              Center(
                child: Container(
                  width: 235,
                  height: 300,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Image.asset('images/asset/delveryPage.png'),
                      SizedBox(height: 10,),
                    ],
                  ),

                ),
              ),
            ],
          ),
        ));
  }
}
