import 'package:flutter/material.dart';
import 'package:xdd/screens/authScreens/forget_Password_Screens/change_Password_screen.dart';
import 'package:xdd/screens/authScreens/forget_Password_Screens/code_confirmation_Screen.dart';
import 'package:xdd/screens/authScreens/forget_Password_Screens/forget_Screen.dart';
import 'package:xdd/screens/authScreens/login_Screen.dart';
import 'package:xdd/screens/authScreens/registration_Screen.dart';
import 'package:xdd/screens/lanach_Screen.dart';
import 'package:xdd/screens/mainScreens/CitiesScreens/CitiesCollectionScreen.dart';
import 'package:xdd/screens/mainScreens/CitiesScreens/placeInCity.dart';
import 'package:xdd/screens/mainScreens/homePage.dart';
import 'package:xdd/screens/story_pages/story_page.dart';
import 'package:xdd/screens/on_bording_Screens/on_bording.dart';
// import 'package:xdd/utils/colors.dart';

void main() {
  runApp( const MyHomePage());
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // darkTheme: ThemeData(
      //   backgroundColor: Colors_APP.backGroundColorDark,
      // ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/lanach_Screen',
      routes: {
        '/lanach_Screen' : (context) => const Lanach_Screen(),
        '/on_Bording_Screen' : (context) => const onBording_Screen(),
        '/Login_Screen' : (context) => const Login_Screen(),
        '/Regestration_Screen' : (context) => const Regestration_Screen(),
        '/Forget_Screen' : (context) => const Forget_Password_Screen(),
        '/Code_verifaction_Screen' : (context) => const CodeVerifacationScreen(),
        '/Change_password_Screen' : (context) => const ChangePasswordScreen(),
        '/Home_Page_Screen' : (context) => const Home_Page_Sreen(),
        '/CitiesCollecationScreen' : (context) => const CitiesCollectionScreen(),
        '/Story_Page_Screen' : (context) => const Story_Page_Screen(),
        '/cityPlaces' : (context) => const PlaceInCity(),
      },
    );
  }
}
