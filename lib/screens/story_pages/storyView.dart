import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xdd/utils/Widgets/story_module.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

class Story_Page_View extends StatefulWidget {

  final String imageStory;
  final String imagePerson;
  final String NamePerson;

  Story_Page_View({
   required this.imageStory,
   required this.imagePerson,
   required this.NamePerson});


  @override
  State<Story_Page_View> createState() => _Story_Page_ViewState();
}

class _Story_Page_ViewState extends State<Story_Page_View> {
  double percent = 0.0;
  late Timer _timer;
  void startTimer(){
    _timer = Timer.periodic(Duration(microseconds: 300), (timer) {
      setState(() {
        percent += 0.0001;
        if(percent > 1){
          _timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }


  @override
  void initState() {
    // TODO: implement initState
startTimer();
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 15),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image:  DecorationImage(
                      image: AssetImage(widget.imageStory),
                      fit: BoxFit.cover
                  )
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 40.0),
                child: Image(
                  image: AssetImage(widget.imageStory),
                ),
              ),),
            Padding(
              padding:  EdgeInsets.only(top: 25),
              child: LinearProgressIndicator(
                value: percent,

              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.imageStory),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        child: Center(
                          child: CircleAvatar(
                            radius: 30,
                            foregroundImage: AssetImage(widget.imagePerson),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                       Styles_App(text: widget.NamePerson.toUpperCase(), fontWeight: FontWeight.w500),
                    ],
                  ),
                  // SizedBox(width: 130),
                   IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.close)),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
