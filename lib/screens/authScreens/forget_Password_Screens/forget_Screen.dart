// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xdd/utils/Helpers.dart';

import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';

class Forget_Password_Screen extends StatefulWidget {
  const Forget_Password_Screen({Key? key}) : super(key: key);

  @override
  _Forget_Password_ScreenState createState() => _Forget_Password_ScreenState();
}

class _Forget_Password_ScreenState extends State<Forget_Password_Screen> {
late  TextEditingController _emailEditingController;
  @override
  void initState() {
    // TODO: implement initState
    _emailEditingController = TextEditingController();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFF8F8F8),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.scaleHeight(50),
                horizontal: SizeConfig.scaleWidth(27)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles_App(
                  text: 'Forgot Password',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                SizedBox(height: SizeConfig.scaleHeight(25)),
                Image.asset(
                  'images/forget_Sc.png',
                  height: SizeConfig.scaleHeight(140),
                  width: SizeConfig.scaleWidth(310),
                ),
                SizedBox(height: SizeConfig.scaleHeight(20)),
                Styles_App(
                  text: 'Username Or E-Mail',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                SizedBox(height: SizeConfig.scaleHeight(9)),
                textField_app(
                  hint: 'Enter your UserName or Email ...',
                  textEditingController: _emailEditingController,
                ),
                SizedBox(height: SizeConfig.scaleHeight(20)),
                ElevatedButton(
                  onPressed: () async{

                      try{
                        await FirebaseAuth.instance.app.setAutomaticDataCollectionEnabled(true);
                        await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailEditingController.text.trim());
                        Helpers.showSnackBar(context, 'We Are Sending url Link to your Email , Please Check your Email',);
                        Navigator.pop(context);

                      }on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          Helpers.showSnackBar(context, 'No user found for that email.',error: true);
                        }
                      }catch (e){
                        Helpers.showSnackBar(context,e.toString(),error: true);
                      }
                  },
                  child: Styles_App(
                    text: 'Send',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    textColor: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, SizeConfig.scaleHeight(50)),
                      primary: Colors_APP.color_primary),
                ),
              ],
            ),
          ),
        ));
  }
}
