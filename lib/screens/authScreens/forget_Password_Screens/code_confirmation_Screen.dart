import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';

class CodeVerifacationScreen extends StatefulWidget {
  const CodeVerifacationScreen({Key? key}) : super(key: key);

  @override
  _CodeVerifacationScreenState createState() => _CodeVerifacationScreenState();
}

class _CodeVerifacationScreenState extends State<CodeVerifacationScreen> {
  late FocusNode _focusNodeCode1;
  late FocusNode _focusNodeCode2;
  late FocusNode _focusNodeCode3;
  late FocusNode _focusNodeCode4;
  bool fiill = false;
  bool fiill1 = false;
  bool fiill2 = false;
  bool fiill3 = false;
  late TextEditingController _textEditingController1;
  late TextEditingController _textEditingController2;
  late TextEditingController _textEditingController3;
  late TextEditingController _textEditingController4;
  String code = '1234';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusNodeCode1 = FocusNode();
    _focusNodeCode2 = FocusNode();
    _focusNodeCode3 = FocusNode();
    _focusNodeCode4 = FocusNode();
    _textEditingController1 = TextEditingController();
    _textEditingController2 = TextEditingController();
    _textEditingController3 = TextEditingController();
    _textEditingController4 = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController1.dispose();
    _textEditingController2.dispose();
    _textEditingController3.dispose();
    _textEditingController4.dispose();
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
        backgroundColor: Color(0xFFF8F8F8),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(50), horizontal: SizeConfig.scaleWidth(27)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles_App(
                  text: 'Enter the code sent to you',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                SizedBox(height: SizeConfig.scaleHeight(25)),
                Image.asset(
                  'images/forget_Sc.png',
                  height: SizeConfig.scaleHeight(140),
                  width: SizeConfig.scaleWidth(310),
                ),
                SizedBox(height: SizeConfig.scaleHeight(20)),
                Center(
                    child: Styles_App(
                  text: 'Please enter the correct code',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  textColor: Colors.black,
                )),
                SizedBox(height: SizeConfig.scaleHeight(20)),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(32)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            textField_app(
                              textEditingController: _textEditingController1,
                              focusNode_: _focusNodeCode1,
                              onChanged_: (String text) {
                                if (text.length == 1) {
                                  _focusNodeCode2.requestFocus();
                                  setState(() {
                                    fiill = !fiill;
                                  });
                                } else if (text.isEmpty) {
                                  setState(() {
                                    fiill = !fiill;
                                  });
                                }
                              },
                              textColors_: fiill ? Colors.white : Colors.black,
                              fillColors: fiill
                                  ? Colors_APP.color_primary
                                  : Colors.white,
                              lengthMax: 1,
                              fontSize_: 20,
                              keyboardType: TextInputType.number,
                              paddeing_content_Hor: 18,
                            ),
                            Positioned(
                              right: SizeConfig.scaleWidth(7),
                              left: SizeConfig.scaleWidth(10),
                              top: SizeConfig.scaleHeight(50),
                              child: Container(
                                width: SizeConfig.scaleWidth(20),
                                height: SizeConfig.scaleHeight(3),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: SizeConfig.scaleWidth(20)),
                      Expanded(
                        child: Stack(
                          children: [
                            textField_app(
                              textEditingController: _textEditingController2,
                              focusNode_: _focusNodeCode2,
                              onChanged_: (String text) {
                                if (text.length == 1) {
                                  _focusNodeCode3.requestFocus();
                                  setState(() {
                                    fiill1 = !fiill1;
                                  });
                                } else if (text.isEmpty) {
                                  setState(() {
                                    fiill1 = !fiill1;
                                  });
                                }
                              },
                              textColors_: fiill1 ? Colors.white : Colors.black,
                              fillColors: fiill1
                                  ? Colors_APP.color_primary
                                  : Colors.white,
                              lengthMax: 1,
                              fontSize_: 20,
                              keyboardType: TextInputType.number,
                              paddeing_content_Hor: 18,
                            ),
                            Positioned(
                              right: SizeConfig.scaleWidth(7),
                              left: SizeConfig.scaleWidth(10),
                              top: SizeConfig.scaleHeight(50),
                              child: Container(
                                width: SizeConfig.scaleWidth(20),
                                height: SizeConfig.scaleHeight(3),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: SizeConfig.scaleWidth(20)),
                      Expanded(
                        child: Stack(
                          children: [
                            textField_app(
                              textEditingController: _textEditingController3,
                              focusNode_: _focusNodeCode3,
                              onChanged_: (String text) {
                                if (text.length == 1) {
                                  _focusNodeCode4.requestFocus();
                                  setState(() {
                                    fiill2 = !fiill2;
                                  });
                                } else if (text.isEmpty) {
                                  setState(() {
                                    fiill2 = !fiill2;
                                  });
                                }
                              },
                              textColors_: fiill2 ? Colors.white : Colors.black,
                              fillColors: fiill2
                                  ? Colors_APP.color_primary
                                  : Colors.white,
                              lengthMax: 1,
                              fontSize_: 20,
                              keyboardType: TextInputType.number,
                              paddeing_content_Hor: 18,
                            ),
                            Positioned(
                              right: SizeConfig.scaleWidth(7),
                              left: SizeConfig.scaleWidth(10),
                              top: SizeConfig.scaleHeight(50),
                              child: Container(
                                width: SizeConfig.scaleWidth(20),
                                height: SizeConfig.scaleHeight(3),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: SizeConfig.scaleWidth(20)),
                      Expanded(
                        child: Stack(
                          children: [
                            textField_app(
                              textEditingController: _textEditingController4,
                              focusNode_: _focusNodeCode4,
                              // fillColors: ,
                              onChanged_: (String text) {
                                if (text.length == 1) {
                                  // _focusNodeCode4.requestFocus();
                                  setState(() {
                                    fiill3 = !fiill3;
                                  });
                                } else if (text.isEmpty) {
                                  setState(() {
                                    fiill3 = !fiill3;
                                  });
                                }
                              },
                              textColors_: fiill3 ? Colors.white : Colors.black,
                              fillColors: fiill3
                                  ? Colors_APP.color_primary
                                  : Colors.white,
                              lengthMax: 1,
                              fontSize_: 20,
                              keyboardType: TextInputType.number,
                              paddeing_content_Hor: 18,
                            ),
                            Positioned(
                              right: SizeConfig.scaleWidth(7),
                              left: SizeConfig.scaleWidth(10),
                              top: SizeConfig.scaleHeight(50),
                              child: Container(
                                width: SizeConfig.scaleWidth(20),
                                height: SizeConfig.scaleHeight(3),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.scaleHeight(10)),
                Center(
                    child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Resend The Code',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.scaleHeight(13),
                      color: Colors_APP.color_primary,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                )),
                SizedBox(height: SizeConfig.scaleHeight(20)),
                Visibility(
                  visible: _textEditingController1.text.isNotEmpty &&
                      _textEditingController2.text.isNotEmpty &&
                      _textEditingController3.text.isNotEmpty &&
                      _textEditingController4.text.isNotEmpty,
                  child: ElevatedButton(
                    onPressed: () {
                      checkData();
                      Navigator.pushReplacementNamed(context, '/Change_password_Screen');
                    },
                    child: Styles_App(
                      text: 'Verifaction',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      textColor: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, SizeConfig.scaleHeight(50)),
                        primary: Colors_APP.color_primary),
                  ),
                ),
                SizedBox(height: SizeConfig.scaleHeight(11)),

              ],
            ),
          ),
        ));
  }

  bool checkData() {
    if (_textEditingController1.text.isNotEmpty &&
        _textEditingController2.text.isNotEmpty &&
        _textEditingController3.text.isNotEmpty &&
        _textEditingController4.text.isNotEmpty) {
      return performData();

    } else {
      return false;
    }
  }

  bool performData() {
    if (_textEditingController1.text +
            _textEditingController2.text +
            _textEditingController3.text +
            _textEditingController4.text ==
        code) {


      return true;
    } else {

      return false;
    }
  }
}
