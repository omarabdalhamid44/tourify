import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_1.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';


class Notifications extends StatelessWidget {
  List notifi = [
    'perspiciatis unde omnis istpoe natus error',
    'perspiciatis unde omnis istpoe natus error',
    'perspiciatis unde omnis istpoe natus error',
    'perspiciatis unde omnis istpoe natus error',
    'perspiciatis unde omnis istpoe natus error',
    'perspiciatis unde omnis istpoe natus error',
    'perspiciatis unde omnis istpoe natus error',
    'perspiciatis unde omnis istpoe natus error',
  ];

  Notifications({Key? key}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Styles_App(
                text: 'Notifications'.toUpperCase(),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notifi.length,
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        width: 375,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 15,
                        left: 10,
                        child: Row(
                          children: [
                            imageIcon.notifiIcon,
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 1,
                              height: 52,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Styles_App(
                              text: notifi[index],
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              textColor: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
