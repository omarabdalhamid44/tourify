// ignore_for_file: camel_case_types, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xdd/databaseManage/DatabasePlaceHistorical.dart';
import 'package:xdd/databaseManage/DatabasePlaceOfEntertainment.dart';
import 'package:xdd/databaseManage/DatabasePlaceReligion.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/grid_city_place.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/Widgets/imageViewInHome.dart';
import 'package:xdd/utils/VeriableConst/imagesAsset_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/wether_condation_widget.dart';
import 'package:xdd/utils/sizeconfig.dart';

class City_Pages_module extends StatefulWidget {
 final String cityName;
 final String cityDiscrption;
 final List cityImage;

   City_Pages_module({
   required this.cityName,
   required this.cityDiscrption,
   required this.cityImage});

  @override
  _City_Pages_moduleState createState() => _City_Pages_moduleState();
}

class _City_Pages_moduleState extends State<City_Pages_module> {
  late PageController _pageViewController;
  late PageController _pageViewCatogriesController;
  int _curent_image = 0;
  int _curent_Catogry = 0;
  DatabasePlaceHistorical databasePlaceHistorical = DatabasePlaceHistorical();
  DatabasePlaceReligion databasePlaceReligion = DatabasePlaceReligion();
  DatabasePlaceOfEntertainment databasePlaceOfEntertainment = DatabasePlaceOfEntertainment();
  List docPlaceHis = [];
  List docPlaceRel = [];
  List docPlaceEnt = [];
  List imagePlaceHis = [];
  List imagePlaceRel = [];
  List imagePlaceEnt = [];
  initialise() async {
    databasePlaceHistorical.read(widget.cityName).then((value) =>
    {
      setState(() {
        docPlaceHis = (value[0]['PlaceHistorical']);
        for (var doc in docPlaceHis) {
          imagePlaceHis.add(doc['Images']);
        }
      })
    });
    databasePlaceReligion.read(widget.cityName).then((value) =>
    {
      setState(() {
        docPlaceRel = (value[0]['PlaceReligion']);
        for (var doc in docPlaceRel) {
           imagePlaceRel.add(doc['Images']);
        }
      })
    });

    databasePlaceOfEntertainment.read(widget.cityName).then((value) =>
    {
      setState(() {
        docPlaceEnt = (value[0]['PlaceOfEntertainment']);
        for (var doc in docPlaceEnt) {
          imagePlaceEnt.add(doc['Images']);

        }
      })
    });
  }
  @override
  void initState() {
    _pageViewController = PageController();
    _pageViewCatogriesController = PageController();
    initialise();
    super.initState();
    // TODO: implement initState
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors_APP.color_primary),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push( context, MaterialPageRoute(builder: (context) => FeverateScreen()));

            },
            icon: imageIcon.heartIcon,
            color: Colors_APP.color_primary,
          ),
          IconButton(
            onPressed: () {
              Navigator.push( context, MaterialPageRoute(builder: (context) => Notifications()));
            },
            icon: imageIcon.notifiIcon,
            color: Colors_APP.color_primary,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles_App(
                text: widget.cityName.toUpperCase(), //اسم المدينة متغير
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),

              SizedBox(height: 20),
              SizedBox(
                  height: SizeConfig.scaleHeight(180),
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemBuilder: (context , index){
                          return ImageView_HomePage(
                              imageName: CachedNetworkImageProvider(widget.cityImage[index]));
                        },
                        itemCount: widget.cityImage.length,
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
                                  duration: Duration(seconds: 2),
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
                                duration: Duration(seconds: 2),
                                curve: Curves.easeIn);
                          },
                          icon: _curent_image == widget.cityImage.indexOf(widget.cityImage.last)
                              ? imageIcon.right2Icon
                              : imageIcon.rightIcon,
                          color: _curent_image == widget.cityImage.indexOf(widget.cityImage.last)
                              ? Colors.grey
                              : Colors.white,
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 10),
              Styles_App(
                text: 'Weather Condition',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              SizedBox(height: 20),
              WeatherCondationWidget( cityName: widget.cityName,),
              SizedBox(height: 20),
              Styles_App(
                text: '${widget.cityName.toUpperCase()} Info', // اسم المدينة متغير
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              SizedBox(height: 10),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:6),
                child: Styles_App(
                  text: widget.cityDiscrption,//متغيير معلومات المدينة
                      // 'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  textColor: Color(0xff303030),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _curent_Catogry = 0;
                            _pageViewCatogriesController.jumpToPage(0);
                          });
                        },
                        child: Text('All'),
                        style: ElevatedButton.styleFrom(
                          primary: _curent_Catogry == 0
                              ? Colors_APP.color_primary
                              : Color(0xffEFEFEF),
                          onPrimary: _curent_Catogry != 0
                              ? Colors_APP.color_primary
                              : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 30,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          shape: BoxShape.rectangle),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _curent_Catogry = 1;
                            _pageViewCatogriesController.jumpToPage(1);
                          });
                        },
                        child: Text('Religious'),
                        style: ElevatedButton.styleFrom(
                          primary: _curent_Catogry == 1
                              ? Colors_APP.color_primary
                              : Color(0xffEFEFEF),
                          onPrimary: _curent_Catogry != 1
                              ? Colors_APP.color_primary
                              : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _curent_Catogry = 2;
                            _pageViewCatogriesController.jumpToPage(2);
                          });
                        },
                        child: Text('Historical'),
                        style: ElevatedButton.styleFrom(
                          primary: _curent_Catogry == 2
                              ? Colors_APP.color_primary
                              : Color(0xffEFEFEF),
                          onPrimary: _curent_Catogry != 2
                              ? Colors_APP.color_primary
                              : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _curent_Catogry = 3;
                            _pageViewCatogriesController.jumpToPage(3);
                          });
                        },
                        child: Text('Entertaining'),
                        style: ElevatedButton.styleFrom(
                          primary: _curent_Catogry == 3
                              ? Colors_APP.color_primary
                              : Color(0xffEFEFEF),
                          onPrimary: _curent_Catogry != 3
                              ? Colors_APP.color_primary
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 800,
                  margin: EdgeInsets.only(top: 20),
                  child: PageView(
                    controller: _pageViewCatogriesController,
                    onPageChanged: (int _pageCatgory) {
                      setState(() {
                        _pageCatgory = _curent_Catogry;
                      });
                    },
                    children: [

                      docPlaceRel.isNotEmpty||docPlaceHis.isNotEmpty||docPlaceEnt.isNotEmpty?  Grid_ForCityPlace(
                        images: imagePlaceRel+
                        imagePlaceHis+
                        imagePlaceEnt,
                        assetImageName: docPlaceRel +
                            docPlaceHis +
                            docPlaceEnt,
                        count: docPlaceRel.length +
                            docPlaceHis.length +
                            docPlaceEnt.length,
                      ):Container(
                          alignment: Alignment.topCenter,
                          child: Styles_App(text: 'No Data Yet.',fontWeight: FontWeight.bold)),
                      docPlaceRel.isNotEmpty?
                      Grid_ForCityPlace(
                        catgory: 'PlaceReligion',
                        images: imagePlaceRel,
                        assetImageName: docPlaceRel,
                        count: docPlaceRel.length,
                      ):Container(
                          alignment: Alignment.topCenter,
                          child: Styles_App(text: 'No Data Yet.',fontWeight: FontWeight.bold)),
                      docPlaceHis.isNotEmpty?
                      Grid_ForCityPlace(
                        images: imagePlaceHis,
                          catgory: 'PlaceHistorical',
                          assetImageName: docPlaceHis,
                          count: docPlaceHis.length):Container(
                          alignment: Alignment.topCenter,
                          child: Styles_App(text: 'No Data Yet.',fontWeight: FontWeight.bold)),
                      docPlaceEnt.isNotEmpty? Grid_ForCityPlace(
                        images: imagePlaceEnt,
                          catgory: 'PlaceOfEntertainment',
                          assetImageName: docPlaceEnt,
                          count: docPlaceEnt.length):Container(
                          alignment: Alignment.topCenter,
                          child: Styles_App(text: 'No Data Yet.',fontWeight: FontWeight.bold)),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
