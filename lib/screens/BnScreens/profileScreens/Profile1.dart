import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:xdd/databaseManage/databaseManage.dart';
import 'package:xdd/screens/BnScreens/profileScreens/componets/ConnectUs.dart';
import 'package:xdd/screens/BnScreens/profileScreens/componets/Delivery.dart';
import 'package:xdd/screens/BnScreens/profileScreens/componets/Emergency&%20Help.dart';
import 'package:xdd/screens/BnScreens/profileScreens/componets/Settings.dart';
import 'package:xdd/screens/BnScreens/profileScreens/componets/aboutus.dart';
import 'package:xdd/screens/BnScreens/profileScreens/componets/car_reservation_Screen.dart';
import 'package:xdd/screens/BnScreens/profileScreens/componets/request_car.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/screens/BnScreens/profileScreens/Profile.dart';
import 'package:xdd/screens/BnScreens/profileScreens/componets/tourists.dart';
import 'package:xdd/screens/authScreens/login_Screen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';

class ProfileOpetion extends StatefulWidget {
  const ProfileOpetion({Key? key}) : super(key: key);

  @override
  State<ProfileOpetion> createState() => _ProfileOpetionState();
}

class _ProfileOpetionState extends State<ProfileOpetion> {
  DatabaseUser dbUser = DatabaseUser();
  List docUser = [];
  List docAllUser = [];
  var auth = FirebaseAuth.instance;

  initialise() async {
    await dbUser.read().then((value) => {
          setState(() {
            docUser = (value);
            print(docUser);
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
    print(docUser);
    return Scaffold(
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
      body: StreamBuilder(
        stream: dbUser.read().asStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Styles_App(
                      text: 'PROFILE',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      textColor: Colors_APP.color_primary,
                    ),
                    SizedBox(height: SizeConfig.scaleHeight(5)),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      leading: Container(
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
                      title: Styles_App(
                        text: docUser.first['FullName'],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        textColor: Colors_APP.color_primary,
                      ),
                      subtitle: Styles_App(
                        text: docUser.first['Email'],
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        textColor: Colors.black,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,color: Colors_APP.color_primary),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                    ),
                    SizedBox(height: SizeConfig.scaleHeight(20)),
                    Profile(
                      data: 'Tourists',
                      image: imageIcon.locationIcon,
                      iconButton: Icon(Icons.chevron_right,color: Colors_APP.color_primary),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tourists()));
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Profile(
                      data: 'Delivery',
                      image: imageIcon.delveryIcon,
                      iconButton: Icon(Icons.chevron_right,color: Colors_APP.color_primary),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Delivery()));
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Profile(
                      data: 'Order Taxi',
                      image: Center(child: Icon(FlutterIcons.taxi_mco,size: 30,color: Colors.white)),
                      iconButton: Icon(Icons.chevron_right,color: Colors_APP.color_primary),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Car_Reservation()));
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Profile(
                      data: 'Car Reservation',
                      image: Center(child: Icon(FlutterIcons.car_alt_faw5s,size: 30,color: Colors.white)),
                      iconButton: Icon(Icons.chevron_right,color: Colors_APP.color_primary),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Reguest_Car()));
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Profile(
                      data: 'Emergency& Help',
                      image: imageIcon.infoIcon,
                      iconButton: Icon(Icons.chevron_right,color: Colors_APP.color_primary),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Emergency_Help()));
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Profile(
                      data: 'Connect Us',
                      image: imageIcon.callingIcon,
                      iconButton: Icon(Icons.chevron_right,color: Colors_APP.color_primary),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConnectUs()));
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Profile(
                      data: 'Settings',
                      image: imageIcon.settingIcon,
                      iconButton: Icon(Icons.chevron_right,color: Colors_APP.color_primary),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Settings()));
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Profile(
                      data: 'About Us',
                      image: imageIcon.moreIcon,
                      iconButton: Icon(Icons.chevron_right,color: Colors_APP.color_primary),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => aboutus()));
                      },
                    ),

                    SizedBox(
                      height: 8,
                    ),
                    Profile(
                      data: 'Log Out',
                      image: imageIcon.logoutIcon,
                      iconButton: Icon(Icons.chevron_right,color: Colors_APP.color_primary),
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 293,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.scaleWidth(20),
                                    vertical: SizeConfig.scaleHeight(20)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 40,
                                          height: 3,
                                          decoration: BoxDecoration(
                                              color: Colors_APP.color_primary,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                        ),
                                      ),
                                      SizedBox(
                                          height: SizeConfig.scaleHeight(15)),
                                      Styles_App(
                                        text: 'Log Out',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      SizedBox(
                                          height: SizeConfig.scaleHeight(20)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Styles_App(
                                            text:
                                                'Do You Really Want To Log Out?!',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            textColor: Colors.black,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: SizeConfig.scaleHeight(20)),

                                      ElevatedButton(
                                        onPressed: () async{
                                         await auth.signOut();
                                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login_Screen(),maintainState: true));
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            minimumSize:
                                                Size(double.infinity, 40),
                                            primary: Colors_APP.color_primary),
                                      ),
                                      SizedBox(
                                          height: SizeConfig.scaleHeight(20)),

                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            minimumSize:
                                                Size(double.infinity, 40),
                                            primary: Color(0xffF8F8F8)),
                                      ),
//*********\
                                    ]),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class Profile extends StatelessWidget {
  String data;
  Widget image;
  Icon iconButton;
  Function() onTap;

  Profile(
      {Key? key,
      required this.data,
      required this.image,
      required this.iconButton,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(children: [
        Container(
          color: Colors.transparent,
          width: double.infinity,
          height: 65,
        ),
        Positioned(
          left: 25,
          right: 0,
          child: Container(
            clipBehavior: Clip.antiAlias,
            width: 200,
            height: 65,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
          ),
        ),
        Positioned(
            top: 20,
            right: 5,
            left: 65,
            bottom: 15,
            child: Text(
              data,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )),
        Positioned(
            bottom: 11,
            right: 325,
            left: 0,
            child: Container(
              height: 45,
              width: 45,
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors_APP.color_primary,
              ),
              child: Center(child: image),
            )),
        Positioned(
          top: 0,
          right: 2,
          bottom: 2,
          child: iconButton,
        ),
      ]),
    );
  }
}
