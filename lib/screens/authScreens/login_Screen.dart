import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
        Navigator.pushNamed(context, '/Regestration_Screen');
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
                          Navigator.pushNamed(context, '/Forget_Screen');
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
                    var result = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: _emailTextEditingController.text,
                        password: _passTextEditingController.text) ;
                    if (result != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Styles_App(text:'logged In',fontWeight: FontWeight.w400,textColor: Colors.white,),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,));
                      Navigator.pushReplacementNamed(
                          context, '/Home_Page_Screen');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Styles_App(text:'Please enter correct data.',fontWeight: FontWeight.w400,textColor: Colors.white,),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,duration: Duration(seconds: 5),));
                    }
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
