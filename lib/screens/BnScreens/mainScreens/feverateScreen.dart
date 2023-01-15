import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xdd/databaseManage/databaseManage.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/imagesAsset_.dart';
import 'package:xdd/utils/Widgets/grid_city_place.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

class FeverateScreen extends StatefulWidget {
  const FeverateScreen({Key? key}) : super(key: key);

  @override
  State<FeverateScreen> createState() => _FeverateScreenState();
}

class _FeverateScreenState extends State<FeverateScreen> {
  DatabaseUser dbUser = DatabaseUser();
  int _curent_Catogry = 0;
  late PageController _pageViewCatogriesController;
  List docPlaceHis = [];
  List docPlaceRel = [];
  List docPlaceEnt = [];
  List imagePlaceHis = [];
  List imagePlaceRel = [];
  List imagePlaceEnt = [];
  List dataFav = [];
  initialise() async {
    dbUser.readFav('PlaceHistorical').then((value) =>
    {
      setState(() {
        docPlaceHis = (value[0]['PlaceHistorical']);
    for (var doc in docPlaceHis) {
      imagePlaceHis.add(doc['Images']);
    }
      })
    });
    dbUser.readFav('PlaceReligion').then((value) =>
    {
      setState(() {
        docPlaceRel = (value[0]['PlaceReligion']);
    for (var doc in docPlaceRel) {
      imagePlaceRel.add(doc['Images']);
    }
      })
    });
    dbUser.readFav('PlaceOfEntertainment').then((value) =>
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
    // TODO: implement initState
    _pageViewCatogriesController = PageController();
initialise();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

        body:  Padding(
          padding:  EdgeInsets.only(top: 30,left: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles_App(text: 'Favorite', fontWeight: FontWeight.bold,fontSize: 20),
                SizedBox(height: 10),

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
                          fav: true,
                          assetImageName: docPlaceRel +
                              docPlaceHis +
                              docPlaceEnt,
                          count: docPlaceRel.length +
                              docPlaceHis.length +
                              docPlaceEnt.length,
                          catgory: '',
                        ):Container(
                            alignment: Alignment.topCenter,
                            child: Styles_App(text: 'No Data Yet.',fontWeight: FontWeight.bold)),
                        docPlaceRel == null?
                       Container(
                            alignment: Alignment.topCenter,
                            child: Styles_App(text: 'No Data Yet.',fontWeight: FontWeight.bold)):
                        Grid_ForCityPlace(
                          fav: true,
                          images: imagePlaceRel,
                          catgory: 'PlaceReligion',
                          assetImageName: docPlaceRel,
                          count: docPlaceRel.length,
                        ),
                        docPlaceHis == null?

                        Container(
                            alignment: Alignment.topCenter,
                            child: Styles_App(text: 'No Data Yet.',fontWeight: FontWeight.bold)): Grid_ForCityPlace(
                            fav: true,
                            catgory: 'PlaceHistorical',
                            images: imagePlaceHis,
                            assetImageName: docPlaceHis,
                            count: docPlaceHis.length),
                        docPlaceEnt== null? Container(
                            alignment: Alignment.topCenter,
                            child: Styles_App(text: 'No Data Yet.',fontWeight: FontWeight.bold)):Grid_ForCityPlace(
                            fav: true,
                            catgory: 'PlaceOfEntertainment',
                            images: imagePlaceEnt,
                            assetImageName: docPlaceEnt,
                            count: docPlaceEnt.length),
                      ],
                    )),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
