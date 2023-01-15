// ignore_for_file: prefer_const_constructors, camel_case_types, file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:xdd/Storge/shared_prefernces.dart';
import 'package:xdd/databaseManage/databaseCities.dart';
import 'package:xdd/databaseManage/databaseManage.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/listOf_Thing.dart';
import 'package:xdd/utils/Widgets/imageViewInHome.dart';
import 'package:xdd/utils/Widgets/stackForGridView.dart';
import 'package:xdd/utils/sizeconfig.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/textField_.dart';
import 'package:xdd/utils/Widgets/wether_condation_widget.dart';

class Home_Page_Sreen extends StatefulWidget {
  const Home_Page_Sreen({Key? key}) : super(key: key);

  @override
  _Home_Page_SreenState createState() => _Home_Page_SreenState();
}

class _Home_Page_SreenState extends State<Home_Page_Sreen> {
  DatabaseCity dbCity = DatabaseCity();
  DatabaseUser dbUser = DatabaseUser();

   List docUser = [];

  List imageCity = [];
  List docCity = [];

  initialise() async {
      dbUser.read().then((value) => {
      setState(() {
        docUser = (value);

      })
    });
    dbCity.read().then((value) => {
          setState(() {
            docCity = (value);
            for (var doc in value) {
              imageCity.add(doc['Images']);
            }
          })
        });

  }

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
    initialise();
    super.initState();

    _pageViewController = PageController();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors_APP.backGroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors_APP.color_primary),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeverateScreen()));
            },
            icon: imageIcon.heartIcon,
            color: Colors_APP.color_primary,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
            icon: imageIcon.notifiIcon,
            color: Colors_APP.color_primary,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: dbCity.read().asStream(),
        builder: (context, snapshot) {
    if(snapshot.hasData){
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: ListView(
              children: [
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  leading: Container(
                    clipBehavior: Clip.antiAlias,
                    width: SizeConfig.scaleWidth(60),
                    height: SizeConfig.scaleHeight(60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: docUser[0]['ImageProfile'] != ''
                        ? Image(
                      image: CachedNetworkImageProvider(
                          docUser[0]['ImageProfile']),
                      fit: BoxFit.cover,)
                        :TextAvatar(
                      fontFamily: 'Poppins',
                      size: double.infinity,
                      backgroundColor: Colors.white,
                      textColor: Colors.white,
                      fontSize: 35,
                      upperCase: true,
                      numberLetters: 1,
                      shape: Shape.Rectangle,
                      text: docUser[0]['FullName'],
                    ),
                  ),
                  title: Styles_App(
                    text: 'Welcome',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    textColor: Colors_APP.colorText_Light,
                  ),
                  subtitle: Styles_App(
                    text: docUser.first['FullName'],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    textColor: Colors_APP.color_primary,
                  ),
                ),
                SizedBox(height: SizeConfig.scaleHeight(20)),
                WeatherCondationWidget(),
                SizedBox(height: SizeConfig.scaleHeight(20)),
                SizedBox(
                    height: SizeConfig.scaleHeight(180),
                    child: Stack(
                      children: [
                        PageView.builder(
                          itemBuilder: (context, ind) {
                            return ImageView_HomePage(
                                imageName: CachedNetworkImageProvider(
                                    imageCity[ind][0].toString()));
                          },
                          itemCount: imageCity.length,
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
                              color: _curent_image == 0
                                  ? Colors.grey
                                  : Colors.white,
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
                            icon: _curent_image == imageCity.indexOf(imageCity.last)
                                ? imageIcon.right2Icon
                                : imageIcon.rightIcon,
                            color: _curent_image == imageCity.indexOf(imageCity.last)
                                ? Colors.grey
                                : Colors.white,
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
                                                width:
                                                    SizeConfig.scaleWidth(10)),
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
                                                  left:
                                                      SizeConfig.scaleWidth(9)),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF8F8F8),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: DropdownButton<String>(
                                                isExpanded: true,
                                                alignment: Alignment.topLeft,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                underline: Text(''),
                                                hint: Styles_App(
                                                  text: 'Country ...',
                                                  fontWeight: FontWeight.w500,
                                                  textColor:
                                                      Colors.grey.shade300,
                                                ),
                                                icon: Icon(Icons
                                                    .keyboard_arrow_down_rounded),
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: SizeConfig
                                                        .scaleTextFont(13),
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500),
                                                elevation: 0,
                                                items: ListOfThings
                                                    .list_of_countries
                                                    .map((String
                                                        dropDownStringItem1) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .centerStart,
                                                    value: dropDownStringItem1,
                                                    child: Styles_App(
                                                      text: dropDownStringItem1,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      textColor: Colors.black,
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (newValueSelected) {
                                                  setState(() {
                                                    selectedItemC =
                                                        newValueSelected;
                                                  });
                                                },
                                                value: selectedItemC,
                                              ),
                                            )),
                                            SizedBox(
                                                width:
                                                    SizeConfig.scaleWidth(10)),
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
                                                width:
                                                    SizeConfig.scaleWidth(10)),
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
                                                    height:
                                                        SizeConfig.scaleHeight(
                                                            58),
                                                    padding: EdgeInsets.only(
                                                        left: SizeConfig
                                                            .scaleWidth(9)),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffF8F8F8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(Icons
                                                            .star_outlined),
                                                        Icon(Icons
                                                            .star_outlined),
                                                        Icon(Icons
                                                            .star_outlined),
                                                        Icon(Icons
                                                            .star_outlined),
                                                        Icon(Icons
                                                            .star_half_outlined),
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
                                            minimumSize:
                                                Size(double.infinity, 55),
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
                SizedBox(
                  height: 800,
                  child: GridView.builder(
                    itemBuilder: (context, index) {
                          return Container(
                            child: stackForGridView(
                                imageName: CachedNetworkImageProvider(
                                    imageCity[index][0]),
                                cityName: docCity[index]['Name'],
                                rate: docCity[index]['Rate']),
                          );
                        },

                    physics: NeverScrollableScrollPhysics(),
                    itemCount: docCity.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                      SizeConfig.scaleWidth(155) / SizeConfig.scaleHeight(180),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: SizeConfig.scaleHeight(230),
                    ),
                  ),
                ),
              ],
            ),
          );}
    return Center(child: CircularProgressIndicator());


        },
      ),
    );
  }

  Row itemMenu(
      {required Widget icon,
      required Function() onpress,
      required String namePage}) {
    return Row(
      children: [
        SizedBox(width: 10),
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
