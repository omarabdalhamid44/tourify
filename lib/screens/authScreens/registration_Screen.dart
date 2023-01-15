// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xdd/screens/BnScreens/BnScreens.dart';
import 'package:xdd/screens/authScreens/login_Screen.dart';
import 'package:xdd/utils/Helpers.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/listOf_Thing.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';

class Regestration_Screen extends StatefulWidget {
  const Regestration_Screen({Key? key}) : super(key: key);

  @override
  _Regestration_ScreenState createState() => _Regestration_ScreenState();
}

class _Regestration_ScreenState extends State<Regestration_Screen> {


  String? selectedItem;
  String? selectedItem1;
  String? selectedItemGender;
  DateTime? _dateTime;
  late TextEditingController _nameTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passTextEditingController;
  late TextEditingController _confirmPassTextEditingController;
  late TextEditingController _mobileNumberTextEditingController;
  late TextEditingController _cityTextEditingController;
  late TextEditingController _passPortTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    _nameTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _passTextEditingController = TextEditingController();
    _confirmPassTextEditingController = TextEditingController();
    _mobileNumberTextEditingController = TextEditingController();
    _cityTextEditingController = TextEditingController();
    _passPortTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.scaleHeight(3),
              horizontal: SizeConfig.scaleWidth(28)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles_App(
                text: 'Create a new account',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Styles_App(
                text: 'Full Name',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              textField_app(
                textEditingController: _nameTextEditingController,
                hint: 'Full Name',
              ),
              SizedBox(height: SizeConfig.scaleHeight(11)),
              Styles_App(

                text: 'Email',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              textField_app(
                textEditingController: _emailTextEditingController,
                hint: 'Enter New Email ',
              ),
              SizedBox(height: SizeConfig.scaleHeight(11)),
              Styles_App(
                text: 'Mobile Number',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: SizeConfig.scaleWidth(10)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton<String>(
                        underline: Text(''),
                        hint: Styles_App(text: 'Code Country..',
                          fontWeight: FontWeight.w500,
                          textColor: Colors.grey.shade300,),
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: SizeConfig.scaleTextFont(13),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                        elevation: 0,
                        items: ListOfThings.list_of_number.map((
                            String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            alignment: AlignmentDirectional.centerStart,
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValueSelected) {
                          setState(() {
                            selectedItem = newValueSelected!;
                          });
                        },
                        value: selectedItem,
                      ),
                    ),
                    SizedBox(width: SizeConfig.scaleWidth(8)),
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        width: SizeConfig.scaleWidth(120),
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: textField_app(
                          textEditingController: _mobileNumberTextEditingController,
                          hint: 'Mobile Number',
                          lengthMax: 10,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true, signed: false),
                        )),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Row(
                children: [
                  Expanded(
                    child: Styles_App(
                      text: 'Country',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Styles_App(
                      text: 'City',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: SizeConfig.scaleWidth(9)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          alignment: Alignment.topLeft,
                          borderRadius: BorderRadius.circular(5),
                          underline: Text(''),
                          hint: Styles_App(text: 'Country ...',
                            fontWeight: FontWeight.w500,
                            textColor: Colors.grey.shade300,),
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: SizeConfig.scaleTextFont(13),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                          elevation: 0,
                          items:
                          ListOfThings.list_of_countries.map((
                              String dropDownStringItem1) {
                            return DropdownMenuItem<String>(
                              alignment: AlignmentDirectional.centerStart,
                              value: dropDownStringItem1,
                              child: Text(dropDownStringItem1),
                            );
                          }).toList(),
                          onChanged: (newValueSelected) {
                            setState(() {
                              selectedItem1 = newValueSelected!;
                            });
                          },
                          value: selectedItem1,
                        ),
                      )),
                  SizedBox(width: SizeConfig.scaleWidth(10)),
                  Expanded(
                      child: textField_app(
                        textEditingController: _cityTextEditingController,
                        hint: 'City ...',
                      )),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Styles_App(
                text: 'Gender',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.scaleWidth(9)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  isExpanded: true,
                  alignment: Alignment.topLeft,
                  borderRadius: BorderRadius.circular(5),
                  underline: Text(''),
                  hint: Styles_App(text: 'Gender',
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey.shade300),
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: SizeConfig.scaleTextFont(13),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  elevation: 0,
                  items: ListOfThings.list_of_gender.map((
                      String dropDownStringItemGender) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.centerStart,
                      value: dropDownStringItemGender,
                      child: Text(dropDownStringItemGender),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      selectedItemGender = newValueSelected!;
                    });
                  },
                  value: selectedItemGender,
                ),
              ),

              SizedBox(
                  height: SizeConfig.scaleHeight(11)),

              Styles_App(
                text: 'Birth Date',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Container(
                  width: double.infinity,
                  height: SizeConfig.scaleHeight(48),
                  padding: EdgeInsets.only(left: SizeConfig.scaleWidth(10),
                      right: SizeConfig.scaleWidth(20)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Styles_App(
                            text: _dateTime == null
                                ? 'dd/mm/yyyy'
                                : _dateTime!.day.toString() +
                                '/' +
                                _dateTime!.month.toString() +
                                '/' +
                                _dateTime!.year.toString(),
                            fontWeight: FontWeight.w400,
                            textColor: _dateTime == null
                                ? Colors.grey
                                : Colors_APP.color_primary,
                          )),
                      SizedBox(width: SizeConfig.scaleWidth(160)),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1980),
                                  lastDate: DateTime(2030),
                                  initialDate: _dateTime == null
                                      ? DateTime.now()
                                      : _dateTime!,
                                  builder: (context, child) =>
                                      Theme(
                                          data: ThemeData().copyWith(
                                            colorScheme: ColorScheme.dark(
                                              primary: Colors.white,
                                              onPrimary: Colors.black,
                                              surface: Color(0xFF6F3CBD),
                                            ),
                                            cardColor: Colors.black,
                                            dialogBackgroundColor:
                                            Color(0xFF6F3CBD),
                                          ),
                                          child: child!)).then((date) {
                                setState(() {
                                  _dateTime = date;
                                });
                              });
                            },
                            child: Icon(
                              Icons.date_range,
                              color: Colors_APP.color_primary,
                            )),
                      ),
                    ],
                  )),
              SizedBox(height: SizeConfig.scaleHeight(11)),
              Styles_App(
                text: 'Password',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              textField_app(
                textEditingController: _passTextEditingController,
                hint: 'Enter New password ... ',
                sucarity: true,
              ),
              SizedBox(height: SizeConfig.scaleHeight(11)),
              Styles_App(

                text: 'Password Confirmation',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              textField_app(
                textEditingController: _confirmPassTextEditingController,
                hint: 'Enter Password Confirmation ... ',
                sucarity: true,
              ),
              SizedBox(height: SizeConfig.scaleHeight(11)),
              ElevatedButton(
                onPressed: () {
                  checkData();
                },
                child: Styles_App(
                  text: 'REGISTRATION',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  textColor: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                        double.infinity, SizeConfig.scaleHeight(50)),
                    primary: Colors_APP.color_primary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkData() async{
    if (_nameTextEditingController.text.isEmpty &&
        _emailTextEditingController.text.isEmpty &&
        _mobileNumberTextEditingController.text.isEmpty &&
        _cityTextEditingController.text.isEmpty &&
        _passTextEditingController.text.isEmpty &&
        _confirmPassTextEditingController.text.isEmpty
        ){
          Helpers.showSnackBar(context, 'Please enter required Data ',error: true);
    }else{
      UserCredential userCredential;
      var auth =FirebaseAuth.instance;
      try {
         userCredential = await auth.createUserWithEmailAndPassword(
            email: _emailTextEditingController.text.trim(),
            password: _passTextEditingController.text.trim()
        );
        await FirebaseFirestore.instance.collection('User').doc(userCredential.user!.uid).set(
            {
              'FullName' : _nameTextEditingController.text,
              'Email' : _emailTextEditingController.text,
              'password' : _passTextEditingController.text,
              'country' : selectedItem1,
              'city' : _cityTextEditingController.text,
              'mobileNumber' : _mobileNumberTextEditingController.text,
              'Gender' : selectedItemGender,
              'BirthDay' : _dateTime.toString(),
              'ImageProfile' : '',
              'cratedAccountAt': DateTime.now().toString(),
              'uid': userCredential.user!.uid,
            });
         Helpers.showSnackBar(context, 'Account Successfully created');

         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Helpers.showSnackBar(context,'The password provided is too weak.',error: false);
        }  else if(_passTextEditingController.text != _confirmPassTextEditingController.text){
          Helpers.showSnackBar(context,'Please enter correct password confirmation',error: false);
        } else if (e.code == 'email-already-in-use') {
          Helpers.showSnackBar(context,'The account already exists for that email.',error: false);
        }
      } catch (e) {
        Helpers.showSnackBar(context,e.toString(),error: true);
      }
    }
  }
}

