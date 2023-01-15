import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/CitiesScreens/CitiesCollectionScreen.dart';
import 'package:xdd/screens/BnScreens/mainScreens/homePage.dart';
import 'package:xdd/screens/BnScreens/profileScreens/Profile1.dart';
import 'package:xdd/screens/BnScreens/chat/chatScreen2.dart';
import 'package:xdd/screens/BnScreens/profileScreens/Profile.dart';
import 'package:xdd/screens/BnScreens/mapsScreen/MapScreen.dart';
import 'package:xdd/utils/Models/BnScreensModel.dart';
import 'package:xdd/utils/Models/Chat.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';


class BnScreens extends StatefulWidget {
  const BnScreens({Key? key}) : super(key: key);

  @override
  State<BnScreens> createState() => _BnScreensState();
}

class _BnScreensState extends State<BnScreens> {
  int indexNow = 0;
List<BottomBarModel> bnScreen = <BottomBarModel>[
  BottomBarModel(Home_Page_Sreen()),
  BottomBarModel(CitiesCollectionScreen()),
  BottomBarModel(MapScreen()),
  BottomBarModel(chatScreen2()),
  BottomBarModel(ProfileOpetion()),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
          onTap: (int selectedIndex) {
            setState(() {
              indexNow = selectedIndex;
            });
          },
          currentIndex: indexNow,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedIconTheme: IconThemeData(color: Colors_APP.color_primary),
          selectedItemColor: Colors_APP.color_primary,
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 12),
          unselectedLabelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 12),
          items: [
            BottomNavigationBarItem(icon: imageIcon.homeIcon, label: 'HomePage'),
            BottomNavigationBarItem(icon: imageIcon.citiesIcon, label: 'Cities'),
            BottomNavigationBarItem(icon: imageIcon.mapIcon, label: 'Map'),
            BottomNavigationBarItem(icon: imageIcon.chatIcon, label: 'Chat'),
            BottomNavigationBarItem(icon: imageIcon.profileIcon2, label: 'Profile'),
          ],
      ),
      body: bnScreen.elementAt(indexNow).body,
    );
  }
}
