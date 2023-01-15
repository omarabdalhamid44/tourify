import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';

import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';



class aboutus extends StatelessWidget {
  const aboutus({Key? key}) : super(key: key);

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
                  text: 'about us'.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              Styles_App(
                text:
                    'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.'
                        ,
                fontWeight: FontWeight.normal,
                fontSize: 15,
                textColor: Colors.black,
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              Container(
                width: 375,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors_APP.color_primary,
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              Styles_App(
                text:
                    'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making yourdecision.\n\nIt is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.'
                       ,
                fontWeight: FontWeight.normal,
                fontSize: 15,
                textColor: Colors.black,
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              Styles_App(
                text:
                'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making yourdecision.\n\nIt is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.'
                ,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
