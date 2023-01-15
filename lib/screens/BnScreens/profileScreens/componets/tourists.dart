import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:xdd/databaseManage/databaseManage.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';


class tourists extends StatefulWidget {


  @override
  State<tourists> createState() => _touristsState();

}

class _touristsState extends State<tourists> {
  DatabaseUser dbUser = DatabaseUser();

  List docAllUser = [];

  initialise() async {

    await dbUser.readAll().then((value) => {
      setState(() {
        docAllUser = (value);
        print(docAllUser);
      })
    });
  }
  bool isSwitched = false;

  @override
  void initState() {
    // TODO: implement initState
    initialise();
    super.initState();
  }
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
      body: StreamBuilder(
        stream: dbUser.readAll().asStream(),
        builder: (context , snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Styles_App(
                        text: 'tourists'.toUpperCase(),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Colors_APP.color_primary,
                      inactiveThumbColor: Colors_APP.color_primary,
                      inactiveTrackColor: Colors.black12,
                    ),
                  ],
                ),
                Styles_App(
                  text: 'Interface For People In The Same Area',
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  textColor: Colors.black,
                ),
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    width: 220,
                    height: 130,
                    color: Colors.transparent,
                    child: Image.asset('images/asset/toursist.png'),
                  ),
                ),
                SizedBox(height: 30),
                Visibility(
                  visible: isSwitched,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: docAllUser.length,
                      itemBuilder: (context, index) =>
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
                      child: docAllUser[index]['ImageProfile'] != ''
                          ? Image(
                        image: CachedNetworkImageProvider(
                            docAllUser[index]['ImageProfile']),
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
                        text: docAllUser[index]['FullName'],
                      ),
                    ),
                    title: Styles_App(
                      text: docAllUser[index]['FullName'],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      textColor: Colors_APP.color_primary,
                    ),
                    subtitle: Styles_App(
                      text: docAllUser[index]['Email'],
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      textColor: Colors.black,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors_APP.color_primary),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ProfileScreen()));
                    },
                  )
                    ),
                  ),
                ),

              ],
            ),
          );

        }),
    );
  }
}
