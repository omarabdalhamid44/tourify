import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xdd/databaseManage/databaseManage.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/screens/BnScreens/profileScreens/EditProfileScreen.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/profileWid.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DatabaseUser dbUser = DatabaseUser();
  List docUser = [];
  var auth = FirebaseAuth.instance;

  initialise() async {
    dbUser.read().then((value) => {
          setState(() {
            docUser = (value);
          })
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors_APP.color_primary),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeverateScreen()));
            },
            icon: imageIcon.heartIcon,
            color: Colors_APP.color_primary,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
            icon: imageIcon.notifiIcon,
            color: Colors_APP.color_primary,
          ),
        ],
      ),
      body:  FutureBuilder(

        future: dbUser.read(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "PROFILE",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6F3CBD),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 101,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/bkProfile.png'),
                            ),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors_APP.color_primary,
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 20,
                          right: 171,
                          bottom: 50,
                          child: Text(
                            docUser[0]['FullName'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 20,
                          right: 241,
                          bottom: 30,
                          child: Styles_App(
                              text: docUser[0]['BirthDay'],
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              textColor: Colors.white),
                        ),
                        Positioned(
                          top: 2,
                          right: 2,
                          left: 300,
                          bottom: 10,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            width: SizeConfig.scaleWidth(60),
                            height: SizeConfig.scaleHeight(60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: docUser[0]['ImageProfile'] != ''
                                ? Image(
                              image: CachedNetworkImageProvider(
                                  docUser[0]['ImageProfile']),
                              fit: BoxFit.cover,)
                                :TextAvatar(
                              fontFamily: 'Poppins',
                              size: double.infinity,
                              backgroundColor: Colors.white,
                              textColor: Colors.white,
                              fontSize: 35,
                              upperCase: true,
                              numberLetters: 1,
                              shape: Shape.Rectangle,
                              text: docUser[0]['FullName'],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'your story'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6F3CBD),
                      ),
                    ),
                    SizedBox(height: 14),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _addNewStoryButton(),

                          Container(
                            margin: EdgeInsets.only(left: 3),
                            alignment: Alignment.center,
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors_APP.color_primary2,
                                  width: 1,
                                )),
                            child: Center(
                              child: CircleAvatar(
                                radius: 30,
                                foregroundImage: AssetImage(
                                    'images/personImage/person1.jpg'),
                              ),
                            ),
                          ),
                          // for (Story story in storiesList)
                          //   _currentStoriesList(
                          //     assetName: story.imagePath,
                          //   ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [],
                      ),
                    ),
                    SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'personal data'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6F3CBD),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfileScreen(
                                            db: dbUser,
                                            fullName: docUser[0]['FullName'],
                                            email: docUser[0]['Email'],
                                        numberPhone: docUser[0]['mobileNumber'],
                                        country: docUser[0]['country'],
                                         city:  docUser[0]['city'],
                                        bithday: docUser[0]['BirthDay'],
                                        image: docUser[0]['ImageProfile'],
                                        uid: docUser[0]['uid'],
                                          )));
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 1),
                    Column(children: <ProfileWid>[
                      ProfileWid(
                          data: docUser[0]['Email'],
                          image: imageIcon.messageIcon),
                      ProfileWid(
                          data: docUser[0]['mobileNumber'],
                          image: imageIcon.callingIcon),
                      ProfileWid(
                          data: docUser[0]['country'] +
                              ' - ' +
                              docUser[0]['city'],
                          image: imageIcon.infoIcon),
                      ProfileWid(
                          data: docUser[0]['city'],
                          image: imageIcon.locationIcon),
                      ProfileWid(
                          data: 'Profile Sharing', image: imageIcon.shareIcon),
                    ]),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Widget _addNewStoryButton() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          height: 65,
          width: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors_APP.color_primary2, width: 1),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors_APP.color_primary,
            child: imageIcon.uploadIcon,
          ),
        ),
      ),
    ],
  );
}

Widget _currentStoriesList({
  required String assetName,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 10, bottom: 17),
          height: 65,
          width: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors_APP.color_primary2, width: 1),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 28.5,
            foregroundImage: AssetImage(assetName),
          ),
        ),
      ),
    ],
  );
}
