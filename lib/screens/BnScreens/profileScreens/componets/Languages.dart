import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';


class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
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
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Styles_App(
                text: 'Languages'.toUpperCase(),
                fontWeight: FontWeight.bold,
                fontSize: 22),
            SizedBox(height: SizeConfig.scaleHeight(15)),
            Styles_App(
              text:
                  'If You Want More Information Read The Attribution Guide License.',
              fontWeight: FontWeight.normal,
              fontSize: 13,
              textColor: Colors.black,
            ),
            SizedBox(height: SizeConfig.scaleHeight(25)),
            Center(
              child: Container(
                width: 260,
                height: 200,
                color: Colors.transparent,
                child: Image.asset('images/asset/lan.png'),
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        width: 35,
                        height: 25,
                        child: Image(
                          image: AssetImage('images/asset/arab.png'),
                          fit: BoxFit.cover,
                        )),
                    SizedBox(width: SizeConfig.scaleWidth(10)),
                    Styles_App(
                      text: 'Arabia',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      textColor: Colors_APP.color_primary,
                    ),
                  ],
                ),
                buildRadio(0)
              ],
            ),
                SizedBox(height: SizeConfig.scaleHeight(10)),
                Container(
                  width:375,
                  height: 1,
                  color: Colors.black12,
                ),
                SizedBox(height: SizeConfig.scaleHeight(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        width: 35,
                        height: 25,
                        child: Image(
                          image: AssetImage('images/asset/eng.png'),
                          fit: BoxFit.cover,
                        )),
                    SizedBox(width: SizeConfig.scaleWidth(10)),
                    Styles_App(
                      text: 'English',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      textColor: Colors_APP.color_primary,
                    ),
                  ],
                ),
                buildRadio(1)
              ],
            ),
                SizedBox(height: SizeConfig.scaleHeight(10)),
                Container(
                  width:375,
                  height: 1,
                  color: Colors.black12,
                ),
                SizedBox(height: SizeConfig.scaleHeight(15)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        width: 35,
                        height: 25,
                        child: Image(
                          image: AssetImage('images/asset/germ.png'),
                          fit: BoxFit.cover,
                        )),
                    SizedBox(width: SizeConfig.scaleWidth(10)),
                    Styles_App(
                      text: 'German',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      textColor: Colors_APP.color_primary,
                    ),
                  ],
                ),
                buildRadio(2)
              ],
            ),
                SizedBox(height: SizeConfig.scaleHeight(10)),
                Container(
                  width:375,
                  height: 1,
                  color: Colors.black12,
                ),
                SizedBox(height: SizeConfig.scaleHeight(15)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        width: 35,
                        height: 25,
                        child: Image(
                          image: AssetImage('images/asset/italy.png'),
                          fit: BoxFit.cover,
                        )),
                    SizedBox(width: 5),
                    Styles_App(
                      text: 'Italian',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      textColor: Colors_APP.color_primary,
                    ),
                  ],
                ),
                buildRadio(3)
              ],
            ),
          ]),
        )));
  }

  Radio<int> buildRadio(int value) {
    return Radio(
      value: value,
      groupValue: _radioValue,
      onChanged: (valu) {
        setState(() {
          _radioValue = valu as int;
        });
      },
      activeColor: Colors_APP.color_primary,
      fillColor: MaterialStateProperty.all(Colors_APP.color_primary),
    );
  }
}
