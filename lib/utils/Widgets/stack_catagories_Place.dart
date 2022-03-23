
import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/imagesAsset_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';

class Stack_catogries_place extends StatelessWidget {
 

  String namePlace ;
  String image_place ;
  Stack_catogries_place({ required this.image_place,required this.namePlace});


  @override
  Widget build(BuildContext context) {

  return  Stack(
    clipBehavior: Clip.antiAlias,
    children: [
      Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5)
          ),
          child: Image(
            image: AssetImage(image_place),
            width: SizeConfig.scaleWidth(166),
            height: SizeConfig.scaleHeight(204),
            fit: BoxFit.cover ,
          )),
      Container(
        width: SizeConfig.scaleWidth(166),
        height: SizeConfig.scaleHeight(204),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 3), blurRadius: 6, color: Colors.black38)
            ]),
      ),
      Positioned(

        top: SizeConfig.scaleHeight(5),
        right: SizeConfig.scaleWidth(20),
        left: SizeConfig.scaleWidth(125),
        bottom: SizeConfig.scaleHeight(156),
        child: Container(
          height: SizeConfig.scaleHeight(28),
          width: SizeConfig.scaleWidth(28),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
          ),
          child: Center(child: imageIcon.heartIcon),
        ),
      ),
      Positioned(
        top: SizeConfig.scaleHeight(153),
        right: SizeConfig.scaleWidth(33),
        left: SizeConfig.scaleWidth(10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Styles_App(
              text: namePlace,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              textColor: Colors.white,
            ),
            SizedBox(height: 3),

            Row(
              children: [
                Icon(Icons.star_outlined, color: Color(0xffF9CD1B),size: 15,),
                Icon(Icons.star, color: Color(0xffF9CD1B),size: 15,),
                Icon(Icons.star, color: Color(0xffF9CD1B),size: 15,),
                Icon(Icons.star, color: Color(0xffF9CD1B),size: 15,),
                Icon(Icons.star_half_outlined, color: Color(0xffF9CD1B),size: 15,),
                Styles_App(text: '4.5', fontWeight: FontWeight.w500, fontSize: 12 , textColor: Colors.white,)

              ],
            ),
          ],
        ),
      ),
    ],
  );


  }

}
