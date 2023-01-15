import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';


class Emergency_Help extends StatefulWidget {
  const Emergency_Help({Key? key}) : super(key: key);

  @override
  State<Emergency_Help> createState() => _Emergency_HelpState();
}

class _Emergency_HelpState extends State<Emergency_Help> {
bool refrigerator =false;
bool dishwasher =false;
bool washingMachine =false;

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
                  text: 'Emergency& Help'.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
              SizedBox(height: SizeConfig.scaleHeight(15)),
              Styles_App(
                text:
                    'If You Want More Information Read The Attribution Guide License.',
                fontWeight: FontWeight.normal,
                fontSize: 13,
                textColor: Colors.black,
              ),
              SizedBox(height: SizeConfig.scaleHeight(22)),
             Center(
                child: Container(
                  width: 280,
                  height: 280,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Image.asset('images/asset/help.png'),
                      SizedBox(height: SizeConfig.scaleHeight(10)),
                      Styles_App(
                        text: 'Direct Contact With Technical Support',
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors_APP.color_primary,
                      ),
                    ),
                    Positioned(
                        top: 14,
                        bottom: 14,
                        left: 14,
                        child: imageIcon.callingIcon),
                    Positioned(
                      top: 8,
                      bottom: 8,
                      left: 50,
                      child: Container(
                        width: 2,
                        height: 36,
                        color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      top: 6,
                      bottom: 8,
                      left: 65,
                      child: TextButton(
                        onPressed: () async {
                          _makePhoneCall('1700 - 600 - 8000');
                        },
                        child: Styles_App(
                          text: 'Direct Number  1700 - 600 - 8000',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          textColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(30)),
              Styles_App(
                  text: 'Help'.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
              SizedBox(height: SizeConfig.scaleHeight(12)),
              Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 350,
                      height:refrigerator?250:50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Styles_App(
                                text: 'Refrigerator',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                textColor: Colors_APP.color_primary,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    refrigerator =!refrigerator;
                                  });
                                },
                                icon: refrigerator?Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down),
                                color: Colors_APP.color_primary,
                              ),
                            ],
                          ),
                            Visibility(
                             visible: refrigerator,
                               child: Divider(height: 15,)),
                            Visibility(
                            visible: refrigerator,
                            child: Container(
                              color: Colors.transparent,
                              child: Styles_App(
                                text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here making it look like readable English.',
                                fontWeight: FontWeight.w500,
                                textColor: Colors.black,
                                fontSize: 14,
                              ) ,
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: SizeConfig.scaleHeight(10)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 350,
                      height:dishwasher?250:50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Styles_App(
                                text: 'Dishwasher',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                textColor: Colors_APP.color_primary,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    dishwasher =!dishwasher;
                                  });
                                },
                                icon: dishwasher?Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down),
                                color: Colors_APP.color_primary,
                              ),
                            ],
                          ),
                          Visibility(
                              visible: dishwasher,
                              child: Divider(height: 15,)),
                          Visibility(
                            visible: dishwasher,
                            child: Container(
                              color: Colors.transparent,
                              child: Styles_App(
                                text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here making it look like readable English.',
                                fontWeight: FontWeight.w500,
                                textColor: Colors.black,
                                fontSize: 14,
                              ) ,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.scaleHeight(10)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 350,
                      height:washingMachine?250:50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Styles_App(
                                text: 'Washing Machine',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                textColor: Colors_APP.color_primary,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    washingMachine =!washingMachine;
                                  });
                                },
                                icon: washingMachine?Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down),
                                color: Colors_APP.color_primary,
                              ),
                            ],
                          ),
                          Visibility(
                              visible: washingMachine,
                              child: Divider(height: 15,)),
                          Visibility(
                            visible: washingMachine,
                            child: Container(
                              color: Colors.transparent,
                              child: Styles_App(
                                text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here making it look like readable English.',
                                fontWeight: FontWeight.w500,
                                textColor: Colors.black,
                                fontSize: 14,
                              ) ,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.scaleHeight(10)),
                  ],
                ),
              ),
            ],
          ),
        )));
  }

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
}
