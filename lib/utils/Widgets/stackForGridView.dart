import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

class stackForGridView extends StatelessWidget {
  String imageName;

  String cityName;
  String descrption;

  stackForGridView(
      {required this.imageName,
      required this.cityName,
      required this.descrption});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors_APP.colorContainar_of_stack,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 3), blurRadius: 6, color: Colors.black38)
              ]),
        ),
        Column(
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: Image(
                  image: AssetImage(imageName),
                  width: double.infinity,
                  height: SizeConfig.scaleHeight(120),
                  fit: BoxFit.fill,
                )),
            SizedBox(height: 7),
            Styles_App(
              text: cityName,
              fontWeight: FontWeight.w600,
              fontSize: 17,
              textColor: Colors_APP.color_primary,
            ),
            SizedBox(height: 3),
            Styles_App(
              text: descrption,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              textColor: Colors_APP.colorText_Light,
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Color(0xffF9CD1B)),
                Icon(Icons.star, color: Color(0xffF9CD1B)),
                Icon(Icons.star, color: Color(0xffF9CD1B)),
                Icon(Icons.star, color: Color(0xffF9CD1B)),
                Icon(Icons.star_half_outlined, color: Color(0xffF9CD1B)),
              ],
            )
          ],
        ),
      ],
    );
  }
}
