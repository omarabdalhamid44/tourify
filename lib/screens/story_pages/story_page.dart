
// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/story_module.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

class Story_Page_Screen extends StatefulWidget {
  const Story_Page_Screen({Key? key}) : super(key: key);

  @override
  _Story_Page_ScreenState createState() => _Story_Page_ScreenState();
}

class _Story_Page_ScreenState extends State<Story_Page_Screen> {
  final List<story_Module> contentOfStory = [
    story_Module(
      personImage: 'images/personImage/person1.jpg',
      storyImage: 'images/placeImage/story1.jpg',
    ),
    story_Module(
        personImage: 'images/personImage/person2.jpg',
        storyImage: 'images/placeImage/story2.jpeg'),
    story_Module(
        personImage: 'images/personImage/person3.jpg',
        storyImage: 'images/placeImage/story3.jpg'),
    story_Module(
        personImage: 'images/personImage/person4.jpg',
        storyImage: 'images/placeImage/story4.jpg'),
    story_Module(
        personImage: 'images/personImage/person5.jpg',
        storyImage: 'images/placeImage/story5.jfif'),
    story_Module(
        personImage: 'images/personImage/person6.jpg',
        storyImage: 'images/placeImage/story6.jfif'),
    story_Module(
        personImage: 'images/personImage/person7.jpg',
        storyImage: 'images/placeImage/story7.jfif'),
    story_Module(
        personImage: 'images/personImage/person8.jpg',
        storyImage: 'images/placeImage/story8.jpg'),
    story_Module(
        personImage: 'images/personImage/person9.jpg',
        storyImage: 'images/placeImage/story9.png'),
  ];

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
        padding: EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
             Styles_App(
              text: 'Story',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 12,
              child: Container(
                // height: 447,
                padding: EdgeInsets.zero,
                child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 101 / 180,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 200,
                    ),
                    children: contentOfStory),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
