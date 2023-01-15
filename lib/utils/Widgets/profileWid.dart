import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';


class ProfileWid extends StatelessWidget {
 String? data;
 ImageIcon image;
 bool isEdit;
 TextEditingController? textEditingController;
   ProfileWid( {Key? key,  this.data,  required this.image, this.isEdit=false , this.textEditingController
   }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Stack(

          children: [
        Container(
          color: Colors.transparent,
          width: double.infinity,
          height: 65,
        ),

        Positioned(
          left: 40,
          right: 0,
          child: Container(

            clipBehavior: Clip.antiAlias,
            width: 250,
            height: 65,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
        Positioned(
            top: 24,
            right: 5,
            left:80,
            bottom: 15,
            child: isEdit
                ? textField_app(
                    textEditingController: textEditingController,
                  )
                : Styles_App(
                   text: data!,
                    fontWeight: FontWeight.w400,
              fontSize: 15,
              textColor: Colors.black,
                  )),
        Positioned(
            bottom: 10,
            right: 300,
            left: 0,
            child: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors_APP.color_primary,
              ),
              child: Center(child: IconButton(
                onPressed: (){},
                icon: image,
                color: Colors.white,
                highlightColor:Colors.transparent ,
                splashColor: Colors.transparent,
              ),),
            )),

      ]),
    );
  }
}