import 'package:flutter/material.dart';
import 'package:xdd/utils/Models/Chat.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

import 'chatScreen1.dart';
import 'chatScreen3.dart';
import 'components/chat_card.dart';

class chatScreen2 extends StatelessWidget {
  const chatScreen2({Key? key}) : super(key: key);

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
            Expanded(
              child: ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (context, index) => ChatCard(
                  chat: chatsData[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => shatScreen3(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/chatScreen1');
        },
        backgroundColor: Colors_APP.color_primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: imageIcon.messageIcon,
      ),
    );
  }
}
