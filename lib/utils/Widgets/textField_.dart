import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xdd/utils/sizeconfig.dart';

class textField_app extends StatelessWidget {

  String? hint;
  TextInputType? keyboardType;
  bool sucarity;
  int? lengthMax;
  Widget? prefix_field;
  Widget? sufix_field;
  double fontSize_;
  double paddeing_content_Hor;
  Color? fillColors;
  Color? textColors_;

  void Function(String value)? onChanged_;

  TextEditingController? textEditingController;
  FocusNode? focusNode_;

  textField_app({this.hint, this.keyboardType = TextInputType
      .text, this.textEditingController,this.sucarity = false, this.lengthMax, this.prefix_field, this.sufix_field, this.fontSize_ = 13, this.paddeing_content_Hor = 8, this.onChanged_,this.fillColors=Colors.white,this.focusNode_ , this.textColors_ =Colors.black});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: onChanged_,
      focusNode: focusNode_,

      style: TextStyle(
          color: textColors_,
          fontSize: fontSize_,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400),
      cursorColor: Colors.black,
      maxLength: lengthMax,
      textAlign: TextAlign.left,
      keyboardType: keyboardType,
      obscureText: sucarity,
      decoration: InputDecoration(


        suffixIcon: sufix_field,
        hintStyle: TextStyle(color: Colors.grey.shade300,
            fontSize: SizeConfig.scaleTextFont(15),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
           overflow: TextOverflow.fade
        ),
        prefix: prefix_field,
        counterText: '',
        contentPadding: EdgeInsets.symmetric(
            vertical:SizeConfig.scaleHeight(5), horizontal: SizeConfig.scaleHeight(paddeing_content_Hor)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),

        ),
        fillColor: fillColors ,
        filled: true,

        hintText: hint,



      ),
    );
  }
}
