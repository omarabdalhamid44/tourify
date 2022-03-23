import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xdd/utils/Widgets/citiesScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/listOf_Thing.dart';
import 'package:xdd/utils/Widgets/imageViewInHome.dart';
import 'package:xdd/utils/VeriableConst/imagesAsset_.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/stackForGridView.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';
import 'package:xdd/utils/Widgets/wether_condation_widget.dart';

class Home_Page_Sreen extends StatefulWidget {
  const Home_Page_Sreen({Key? key}) : super(key: key);

  @override
  _Home_Page_SreenState createState() => _Home_Page_SreenState();
}

class _Home_Page_SreenState extends State<Home_Page_Sreen> {
  late PageController _pageViewController;
  int _curent_image = 0;
  bool press = false;
  bool press1 = false;
  bool press2 = false;

  String? selectedItemC;
  String? selectedItemP;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageViewController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_APP.backGroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors_APP.color_primary,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: imageIcon.menueLightIcon,
              color: Colors_APP.color_primary,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: imageIcon.heartIcon,
            color: Colors_APP.color_primary,
          ),
          IconButton(
            onPressed: () {},
            icon: imageIcon.notifiIcon,
            color: Colors_APP.color_primary,
          )
        ],
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(130)),
        child: Drawer(
          child: Padding(
            padding: EdgeInsets.only(top: SizeConfig.scaleHeight(80)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // alignment: Alignment.centerLeft,
                          width: SizeConfig.scaleWidth(64),
                          height: SizeConfig.scaleHeight(64),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                              AssetImage('images/personImage/person2.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.scaleHeight(10)),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: SizeConfig.scaleHeight(10)),
                            Styles_App(
                              text: 'Omar Abd-Alhamid',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              textColor: Colors_APP.color_primary,
                            ),
                            SizedBox(height: 5),
                            Styles_App(
                              text: 'omarabdalhamid44@gmail.com',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              textColor: Colors_APP.colorText_Light,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 60,
                  thickness: 1,
                ),
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll) {
                    overScroll.disallowGlow();
                    return true;
                  },
                  child: Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        itemMenu(
                            icon: imageIcon.homeIcon,
                            onpress: () {
                              Navigator.of(context).pop();
                            },
                            namePage: 'Home'),
                        itemMenu(
                            icon: imageIcon.citiesIcon,
                            onpress: () {
                              Navigator.pushNamed(
                                  context, '/CitiesCollecationScreen');
                            },
                            namePage: 'Cities'),
                        itemMenu(
                            icon: imageIcon.storyIcon,
                            onpress: () {
                              Navigator.pushNamed(
                                  context, '/Story_Page_Screen');
                            },
                            namePage: 'Story'),
                        itemMenu(
                            icon: imageIcon.mapIcon,
                            onpress: () {},
                            namePage: 'Map App'),
                        itemMenu(
                            icon: imageIcon.locationIcon,
                            onpress: () {},
                            namePage: 'Tourists'),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> ))
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 12),
                              Icon(
                                Icons.directions_car,
                                size: 30,
                                color: Colors_APP.color_primary,
                              ),
                              SizedBox(width: 8),
                              Styles_App(
                                text: 'Car&Delvirey Servcies',
                                fontWeight: FontWeight.w400,
                                textColor: Colors.black,
                                fontSize: 15,
                              ),
                              SizedBox(width: 20),
                              Icon(Icons.arrow_forward_ios,
                                  color: Colors_APP.color_primary)
                            ],
                          ),
                        ),
                        itemMenu(
                            icon: imageIcon.InfoIcon,
                            onpress: () {},
                            namePage: 'Emergency& Help'),
                        itemMenu(
                            icon: imageIcon.callingIcon,
                            onpress: () {},
                            namePage: 'Connect Us'),
                        itemMenu(
                            icon: imageIcon.profileIcon,
                            onpress: () {},
                            namePage: 'Profile'),
                        itemMenu(
                            icon: imageIcon.settingIcon,
                            onpress: () {},
                            namePage: 'Setting'),
                        itemMenu(
                            icon: imageIcon.logoutIcon,
                            onpress: () {},
                            namePage: 'Sign Out'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              leading: Container(
                alignment: Alignment.centerLeft,
                width: SizeConfig.scaleWidth(64),
                height: SizeConfig.scaleHeight(64),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('images/personImage/person2.jpg'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blue),
              ),
              title: Styles_App(
                text: 'Welcome',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                textColor: Colors_APP.colorText_Light,
              ),
              subtitle: Styles_App(
                text: 'Omar Abd-Alhamid',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                textColor: Colors_APP.color_primary,
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(20)),
            WeatherCondationWidget(),
            SizedBox(height: SizeConfig.scaleHeight(20)),
            Container(
                height: SizeConfig.scaleHeight(180),
                child: Stack(
                  children: [
                    PageView.builder(
                      itemBuilder: (context, index) {
                        return ImageView_HomePage(
                            imageName:
                            imagesAsset_.Image_Cities.elementAt(index));
                      },
                      itemCount: imagesAsset_.Image_Cities.length,
                      controller: _pageViewController,
                      onPageChanged: (int cruentImage) {
                        setState(() {
                          _curent_image = cruentImage;
                        });
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.5)
                            ],
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomStart),
                      ),
                    ),
                    Positioned(
                        left: SizeConfig.scaleWidth(250),
                        right: SizeConfig.scaleWidth(50),
                        top: SizeConfig.scaleHeight(130),
                        bottom: SizeConfig.scaleHeight(2),
                        child: IconButton(
                          onPressed: () {
                            _pageViewController.previousPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeOut);
                          },
                          icon: _curent_image == 0
                              ? imageIcon.leftIcon
                              : imageIcon.left2Icon,
                          color:
                          _curent_image == 0 ? Colors.grey : Colors.white,
                        )),
                    Positioned(
                      left: SizeConfig.scaleWidth(300),
                      right: SizeConfig.scaleWidth(2),
                      top: SizeConfig.scaleHeight(130),
                      bottom: SizeConfig.scaleHeight(2),
                      child: IconButton(
                        onPressed: () {
                          _pageViewController.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn);
                        },
                        icon: _curent_image == 5
                            ? imageIcon.right2Icon
                            : imageIcon.rightIcon,
                        color: _curent_image == 5 ? Colors.grey : Colors.white,
                      ),
                    )
                  ],
                )),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Styles_App(
                      text: 'The Cities',
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      textColor: Colors_APP.color_primary,
                    )),
                Expanded(
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50))),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: SizeConfig.scaleWidth(20),
                                          vertical: SizeConfig.scaleHeight(20)),
                                      child: Column(children: [
                                        Container(
                                          width: 40,
                                          height: 3,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                        ),
                                        SizedBox(
                                            height: SizeConfig.scaleHeight(15)),
                                        Styles_App(
                                            text: 'Filter Latest Offers',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        SizedBox(
                                            height: SizeConfig.scaleHeight(20)),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Styles_App(
                                                    text: 'Country',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15)),
                                            SizedBox(
                                                width: SizeConfig.scaleWidth(
                                                    10)),
                                            Expanded(
                                                child: Styles_App(
                                                    text: 'City',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15)),
                                          ],
                                        ),
                                        SizedBox(
                                            height: SizeConfig.scaleHeight(10)),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: SizeConfig
                                                          .scaleWidth(9)),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffF8F8F8),
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                  child: DropdownButton<String>(
                                                    isExpanded: true,
                                                    alignment: Alignment
                                                        .topLeft,
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                    underline: Text(''),
                                                    hint: Styles_App(
                                                      text: 'Country ...',
                                                      fontWeight: FontWeight
                                                          .w500,
                                                      textColor: Colors.grey
                                                          .shade300,
                                                    ),
                                                    icon: Icon(Icons
                                                        .keyboard_arrow_down_rounded),
                                                    style: TextStyle(
                                                        color: Colors.black87,
                                                        fontSize:
                                                        SizeConfig
                                                            .scaleTextFont(
                                                            13),
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight
                                                            .w500),
                                                    elevation: 0,
                                                    items: ListOfThings
                                                        .list_of_countries
                                                        .map((String
                                                    dropDownStringItem1) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        alignment: AlignmentDirectional
                                                            .centerStart,
                                                        value: dropDownStringItem1,
                                                        child: Styles_App(
                                                          text: dropDownStringItem1,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          textColor: Colors
                                                              .black,
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: (
                                                        newValueSelected) {
                                                      setState(() {
                                                        selectedItemC =
                                                            newValueSelected;
                                                      });
                                                    },
                                                    value: selectedItemC,
                                                  ),
                                                )),
                                            SizedBox(
                                                width: SizeConfig.scaleWidth(
                                                    10)),
                                            Expanded(
                                                child: textField_app(
                                                  hint: 'City ...',
                                                  fillColors: Color(0xffF8F8F8),
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                            height: SizeConfig.scaleHeight(20)),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Styles_App(
                                                    text: 'Price',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15)),
                                            SizedBox(
                                                width: SizeConfig.scaleWidth(
                                                    10)),
                                            Expanded(
                                                child: Styles_App(
                                                    text: 'Evaluation',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15)),
                                          ],
                                        ),
                                        SizedBox(
                                            height: SizeConfig.scaleHeight(10)),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: SizeConfig
                                                          .scaleWidth(9)),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffF8F8F8),
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                  child: DropdownButton<String>(
                                                    isExpanded: true,
                                                    alignment: Alignment
                                                        .topLeft,
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                    underline: Text(''),
                                                    hint: Styles_App(
                                                      text: '00 \$ ',
                                                      fontWeight: FontWeight
                                                          .w500,
                                                      textColor: Colors.grey
                                                          .shade300,
                                                    ),
                                                    icon: Icon(Icons
                                                        .keyboard_arrow_down_rounded),
                                                    style: TextStyle(
                                                        color: Colors.black87,
                                                        fontSize:
                                                        SizeConfig
                                                            .scaleTextFont(
                                                            13),
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight
                                                            .w500),
                                                    elevation: 0,
                                                    items: ListOfThings
                                                        .list_of_price
                                                        .map((String
                                                    dropDownStringItem1) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        alignment: AlignmentDirectional
                                                            .centerStart,
                                                        value: dropDownStringItem1,
                                                        child: Styles_App(
                                                          text: dropDownStringItem1,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          textColor: Colors
                                                              .black,
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: (
                                                        newValueSelected) {
                                                      setState(() {
                                                        selectedItemP =
                                                            newValueSelected;
                                                      });
                                                    },
                                                    value: selectedItemP,
                                                  ),
                                                )),
                                            SizedBox(
                                                width: SizeConfig.scaleWidth(
                                                    10)),
                                            Expanded(
                                                child: Container(
                                                    height:
                                                    SizeConfig.scaleHeight(58),
                                                    padding: EdgeInsets.only(
                                                        left: SizeConfig
                                                            .scaleWidth(
                                                            9)),
                                                    decoration: BoxDecoration(
                                                        color: Color(
                                                            0xffF8F8F8),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                      Icon(Icons.star_outlined),
                                                      Icon(Icons.star_outlined),
                                                      Icon(Icons.star_outlined),
                                                      Icon(Icons.star_outlined),
                                                      Icon(Icons.star_half_outlined),
                                                      ],
                                                    ))),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Styles_App(
                                            text: 'Filter',
                                            fontWeight: FontWeight.w600,
                                            textColor: Colors.white,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors_APP.color_primary,
                                            minimumSize: Size(
                                                double.infinity, 55),

                                          ),
                                        )
                                      ])));
                            });
                      },
                      icon: imageIcon.filterIcon,
                      color: Colors_APP.color_primary,
                    )),
              ],
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(20),
            ),
            pageCitiesWidget()
          ],
        ),
      ),
    );
  }

  Row itemMenu({required ImageIcon icon,
    required Function() onpress,
    required String namePage}) {
    return Row(
      children: [
        SizedBox(width: 3),
        IconButton(
          onPressed: onpress,
          icon: icon,
          color: Colors_APP.color_primary,
        ),
        InkWell(
          onTap: onpress,
          child: Styles_App(
            text: namePage,
            fontWeight: FontWeight.w400,
            fontSize: 15,
            textColor: Colors.black,
          ),
        )
      ],
    );
  }
}
