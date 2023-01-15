
// ignore_for_file: camel_case_types, file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:xdd/utils/sizeconfig.dart';

class ImageView_HomePage extends StatelessWidget {
 ImageProvider imageName;


 ImageView_HomePage({required this.imageName});

 @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)),
        child: Image(
          image: imageName,
          width: double.infinity,
          height: SizeConfig.scaleHeight(180),
          fit: BoxFit.fill,
        ));
  }
}