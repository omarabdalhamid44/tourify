
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xdd/Storge/shared_prefernces.dart';
import 'package:xdd/screens/lanach_Screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
        SharedPref().initalizationPrefernces();

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

      debugShowCheckedModeBanner: false,
      home: Lanach_Screen(),

    );
  }
}
