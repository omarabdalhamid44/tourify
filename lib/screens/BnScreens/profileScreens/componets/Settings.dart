import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/screens/BnScreens/profileScreens/componets/Languages.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles_App(
                  text: 'Settings'.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              SizedBox(height: SizeConfig.scaleHeight(15)),
              Styles_App(
                text:
                    'You can set the settings you like',
                fontWeight: FontWeight.normal,
                fontSize: 13,
                textColor: Colors.black,
              ),
              SizedBox(height: SizeConfig.scaleHeight(22)),
              Center(
                child: Container(
                  width: 265,
                  height: 200,
                  color: Colors.transparent,
                  child: Image.asset('images/asset/setting.png'),
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(30)),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 350,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          bottom: 13,
                          child: Styles_App(
                            text: 'Language',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            textColor: Colors_APP.color_primary,
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 2,
                            bottom: 2,
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => Languages()));
                              },
                              icon: Icon(Icons.chevron_right),
                              color: Colors_APP.color_primary,
                            )),
                      ],
                    ),
                    SizedBox(height: SizeConfig.scaleHeight(10)),

                    Stack(
                      children: [
                        Container(
                          width: 350,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          bottom: 13,
                          child: Styles_App(
                            text: 'Change Password',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            textColor: Colors_APP.color_primary,
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 2,
                            bottom: 2,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chevron_right),
                              color: Colors_APP.color_primary,
                            )),
                      ],
                    ),
                    SizedBox(height: SizeConfig.scaleHeight(10)),

                    Stack(
                      children: [
                        Container(
                          width: 350,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          bottom: 13,
                          child: Styles_App(
                            text: 'Night Mode',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            textColor: Colors_APP.color_primary,
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 2,
                            bottom: 2,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value){
                                setState(() {
                                  isSwitched=value;
                                });
                              },
                              activeColor: Colors.white,
                              activeTrackColor: Colors_APP.color_primary,
                              inactiveThumbColor: Colors_APP.color_primary,
                              inactiveTrackColor: Colors.black12,
                            ),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
