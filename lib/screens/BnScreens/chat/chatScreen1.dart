import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';


class chatScreen1 extends StatelessWidget {
  const chatScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors_APP.color_primary,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: imageIcon.heartIcon,
            color: Colors_APP.color_primary,
          ),
          IconButton(
            onPressed: () {},
            icon: imageIcon.notifiIcon,
            color: Colors_APP.color_primary,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Styles_App(
                text: 'chat'.toUpperCase(),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            SizedBox(
              height: 150,
            ),
            Center(
              child: Container(
                width: 235,
                height: 300,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Image.asset('images/chat.png'),
                    SizedBox(
                      height: 10,
                    ),
                    Styles_App(
                      text: 'No Messages',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/chatScreen2');
        },
        backgroundColor: Colors_APP.color_primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child:imageIcon.messageIcon,
      ),
    );
  }
}
