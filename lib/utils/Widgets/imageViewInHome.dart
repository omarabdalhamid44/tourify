
import 'package:flutter/material.dart';
import 'package:xdd/utils/sizeconfig.dart';

class ImageView_HomePage extends StatelessWidget {
 String imageName;


 ImageView_HomePage({required this.imageName});

 @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)),
        child: Image(
          image: AssetImage(imageName),
          width: double.infinity,
          height: SizeConfig.scaleHeight(180),
          fit: BoxFit.fill,
        ));
  }
}