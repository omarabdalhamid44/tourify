// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:xdd/screens/story_pages/storyView.dart';

class story_Module extends StatefulWidget {
  final String personImage;
  final String storyImage;
  final Function? onTap;

  const story_Module(
      {required this.personImage, required this.storyImage, this.onTap});

  @override
  State<story_Module> createState() => _story_ModuleState();
}

class _story_ModuleState extends State<story_Module> {
  bool press = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            settings: RouteSettings(name: "/StoryViewScreen"),
            builder: (context) => Story_Page_View(
                  imagePerson: widget.personImage,
                  imageStory: widget.storyImage,
                  NamePerson: 'omar abdalhamid',
                )));
        setState(() {
          press = true;
        });
      },
      child: Stack(children: [
        Container(
          color: Colors.transparent,
          width: double.infinity,
          height: 190,
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          width: double.infinity,
          height: 167,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Image(
            image: AssetImage(widget.storyImage),
            fit: BoxFit.cover,
            isAntiAlias: true,
          ),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          width: double.infinity,
          height: 167,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5)),
        ),
        Positioned(
            bottom: 5,
            right: 25,
            left: 25,
            child: Container(
              height: 65,
              width: 65,
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 2, color: press ? Colors.grey : Colors.green)),
              child: Center(
                child: CircleAvatar(
                  radius: 30,
                  foregroundImage: AssetImage(widget.personImage),
                ),
              ),
            ))
      ]),
    );
  }
}
