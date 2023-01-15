// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:xdd/screens/authScreens/login_Screen.dart';
import 'package:xdd/screens/on_bording_Screens/content_onbording_Screen.dart';
import 'package:xdd/screens/on_bording_Screens/indecator_onBording.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/sizeconfig.dart';

class onBording_Screen extends StatefulWidget {

  const onBording_Screen({Key? key}) : super(key: key);

  @override
  State<onBording_Screen> createState() => _onBording_ScreenState();
}

class _onBording_ScreenState extends State<onBording_Screen> {
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();

  }

  int _cruent_Page = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal:10,vertical:20),
          child: Stack(
            children: [

              PageView(
                children: [

                  OnBordingScreenWid(title: 'Destination ', subTitle: 'We have maps of places that allow users to know the places and navigate easily, calculate the different distances between cities and calculate the time needed to reach the place they want in the way they prefer (walking - using a car)', image: 'images/onbord1.png'),
                  OnBordingScreenWid(title: 'Image 360°', subTitle: 'The navigation feature is available by displaying 360-degree images that allow the user to see the place from all sides he wants', image: 'images/onbord2.png'),
                  OnBordingScreenWid(title: 'Enjoy Your Holiday', subTitle: 'Welcome to TouRelish, and we hope that you will have a nice enjoyment of all the services and features that we offer and are available in your hands', image: 'images/onbord3.png')
                ],

                controller: _pageController,
                   onPageChanged: (int curentPage ){
                    setState(() {
                      _cruent_Page = curentPage;
                    });
    },
                ),

              Positioned(
                  top:SizeConfig.scaleHeight(590),
                  right: SizeConfig.scaleWidth(30),
                  left: SizeConfig.scaleWidth(130),
                  // bottom: 200,
                  child: Row(
                    children: [
                      indecator_onBording(seleted: _cruent_Page == 0,),
                      indecator_onBording(seleted: _cruent_Page == 1,),
                      indecator_onBording(seleted: _cruent_Page == 2,),
                    ],
                  )
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: _cruent_Page != 2,
                    child: TextButton(onPressed: (){
                      _pageController.jumpToPage(2);
                    }, child: Text('Skip' , style: TextStyle(fontSize: SizeConfig.scaleTextFont(18) , color: Colors.black ,fontFamily: 'Poppins' , fontWeight: FontWeight.w500))),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                      child: Visibility(
                        visible: _cruent_Page == 1 ,
                        child: TextButton(onPressed: (){
                          _pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
                        }, child: Text('Back',style: TextStyle(fontSize: SizeConfig.scaleTextFont(18) , color: Colors.black ,fontFamily: 'Poppins' , fontWeight: FontWeight.w400))),
                      ),
                    ),
                      // SizedBox(width: 50,),
                      Spacer(),
                      Visibility(
                        visible: _cruent_Page != 2,
                        child: TextButton(onPressed: (){
                          _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
                        }, child: Text('Next',style: TextStyle(fontSize: SizeConfig.scaleTextFont(18) , color: Colors.black,fontFamily: 'Poppins' , fontWeight: FontWeight.w500 ))),
                      ),


                    ],
                  ),
                  Visibility(
                    visible: _cruent_Page == 2  ,
                    child: TextButton(onPressed: (){
                      _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
                    }, child: ElevatedButton(onPressed: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Login_Screen()));
                    },
                        child: Text('Get Statred' , style: TextStyle(fontSize: SizeConfig.scaleTextFont(17) , color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors_APP.color_primary,
                      minimumSize: Size(double.infinity, SizeConfig.scaleHeight(50)),

                    ),
                    ),
                  ),
                  )],
              ),

            ],
          ),

        ),

    );
  }
}
