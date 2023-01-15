// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/BnScreens.dart';
import 'package:xdd/screens/BnScreens/profileScreens/Profile.dart';
import 'package:xdd/screens/authScreens/forget_Password_Screens/forget_Screen.dart';
import 'package:xdd/screens/authScreens/registration_Screen.dart';
import 'package:xdd/utils/Helpers.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passTextEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passTextEditingController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Regestration_Screen()));
      };
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextEditingController.dispose();
    _passTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles_App(
                  text: 'Log-In',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                SizedBox(height: SizeConfig.scaleHeight(25)),
                Image.asset(
                  'images/logIn_Sc.png',
                  height: 140,
                  width: 310,
                ),
                SizedBox(height: SizeConfig.scaleHeight(20)),
                Styles_App(
                  text: 'Username Or E-Mail',
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
                SizedBox(height: SizeConfig.scaleHeight(9)),
                textField_app(
                    hint: 'Enter Your UserName Or E-mail',
                    textEditingController: _emailTextEditingController),
                SizedBox(height: SizeConfig.scaleHeight(9)),
                Styles_App(
                  text: 'Password',
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
                SizedBox(height: SizeConfig.scaleHeight(9)),
                textField_app(
                  hint: '***********',
                  sucarity: true,
                  textEditingController: _passTextEditingController,
                ),
                SizedBox(height: SizeConfig.scaleHeight(9)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Forget_Password_Screen()));
                        },
                        child: Styles_App(
                          text: 'Forgot Password ?',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ))
                  ],
                ),
                SizedBox(height: SizeConfig.scaleHeight(8)),
                ElevatedButton(
                  onPressed: () async {
                     cheakFieldError(_emailTextEditingController.text, _passTextEditingController.text, context);

                  },
                  child: Styles_App(
                    text: 'Log In',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    textColor: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                      Size(double.infinity, SizeConfig.scaleHeight(45)),
                      primary: Colors_APP.color_primary),
                ),
                SizedBox(height: SizeConfig.scaleHeight(8)),
                RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(text: '   ', children: [
                      TextSpan(
                          text: 'I don\'t have an account ? ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: SizeConfig.scaleTextFont(15),
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          recognizer: _tapGestureRecognizer,
                          text: 'new account ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: SizeConfig.scaleTextFont(15),
                              fontWeight: FontWeight.w600)),
                    ]))
              ],
            ),
          ),
        ));
  }
}

Future cheakFieldError(String email,String pass,BuildContext context) async{
  UserCredential? userCredential;
  var auth=  FirebaseAuth.instance;
  try {
       userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: pass,
      );
         Helpers.showSnackBar(context, 'Login Succsesfuly',error: false);
       Navigator.pushReplacement( context ,MaterialPageRoute(builder: (context)=> BnScreens()));


  } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Helpers.showSnackBar(context, 'No user found for that email.',error: true);
      } else if (e.code == 'wrong-password') {
        Helpers.showSnackBar(context, 'Wrong password provided for that user.',error: true);
      }else {
        Helpers.showSnackBar(context, e.message.toString(),error: true);

      }

    }catch (e){
    Helpers.showSnackBar(context,e.toString(),error: true);
  }
}

