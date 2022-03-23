import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';

class Login_Screen extends StatefulWidget {


  const Login_Screen({Key? key}) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}


class _Login_ScreenState extends State<Login_Screen> {
 late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap= (){
      Navigator.pushNamed(context, '/Regestration_Screen');
    };

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 50 , horizontal: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles_App(text: 'Log-In', fontWeight: FontWeight.bold , fontSize: 20,),
                SizedBox(height: SizeConfig.scaleHeight(25)),
                Image.asset('images/logIn_Sc.png', height: 140,width: 310,),
                SizedBox(height: SizeConfig.scaleHeight(20)),
                Styles_App(text: 'Username Or E-Mail', fontWeight: FontWeight.w400 , fontSize: 17,),
                SizedBox(height: SizeConfig.scaleHeight(9)),
                textField_app(hint: 'Enter Your UserName Or E-mail',),
                SizedBox(height: SizeConfig.scaleHeight(9)),
                Styles_App(text: 'Password', fontWeight: FontWeight.w400 , fontSize: 17,),
                SizedBox(height: SizeConfig.scaleHeight(9)),
                textField_app(hint: '***********',sucarity: true,),
                SizedBox(height: SizeConfig.scaleHeight(9)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap:(){
                              Navigator.pushNamed(context, '/Forget_Screen');
                    },
                        child: Styles_App(text: 'Forgot Password ?', fontWeight: FontWeight.w400, fontSize: 14,))
                  ],
                ),
                SizedBox(height: SizeConfig.scaleHeight(8)),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/Home_Page_Screen');
                    },
                    child: Styles_App(text: 'Log In', fontWeight: FontWeight.bold , fontSize: 17,textColor: Colors.white,),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity , SizeConfig.scaleHeight(45) ),
                    primary: Colors_APP.color_primary
                  ),
                ),
                SizedBox(height: SizeConfig.scaleHeight(8)),

                  RichText(
                    textAlign: TextAlign.start,
                      text: TextSpan(
                    text: '   ',
                    children: [
                      TextSpan(text: 'I don\'t have an account ? ', style: TextStyle(color: Colors.black , fontFamily: 'Poppins' , fontSize: SizeConfig.scaleTextFont(15) , fontWeight: FontWeight.w400)),
                      TextSpan(recognizer: _tapGestureRecognizer,text: 'new account ', style: TextStyle(color: Colors.black , fontFamily: 'Poppins' , fontSize: SizeConfig.scaleTextFont(15)  , fontWeight: FontWeight.w600)),
                    ]
                  ))
              ],
          ),
        ),
      )
    );
  }


}
