import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';

class indecator_onBording extends StatelessWidget {
bool seleted = false;

indecator_onBording({required this.seleted });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:seleted? 35 : 15,
      height : 5,
      margin: EdgeInsets.symmetric(horizontal: 4,vertical: 30),
      decoration: BoxDecoration(
        color: seleted ? Colors_APP.color_primary : Colors.grey ,
        // shape: BoxShape.rectangle,

        borderRadius: BorderRadius.circular(5),
      ));


  }
}
