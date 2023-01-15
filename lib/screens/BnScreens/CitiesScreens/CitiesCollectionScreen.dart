// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:xdd/databaseManage/databaseCities.dart';
import 'package:xdd/screens/BnScreens/CitiesScreens/city_page.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/stackForGridView.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';

class CitiesCollectionScreen extends StatefulWidget {
  const CitiesCollectionScreen({Key? key}) : super(key: key);

  @override
  State<CitiesCollectionScreen> createState() => _CitiesCollectionScreenState();
}

class _CitiesCollectionScreenState extends State<CitiesCollectionScreen> {
DatabaseCity dbCity = DatabaseCity();
List docCity = [];
List imageCity = [];
  initialise() async {
    dbCity.read().then((value) =>
    {
      setState(() {
        docCity = (value);
        for (var doc in value) {
          imageCity.add(doc['Images']);
        }
      })
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    initialise();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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

      body: StreamBuilder(
        stream: dbCity.read().asStream(),
        builder: (context , snapshot){
          return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(right: 10,left: 10,top: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Styles_App(
                      text: 'The Cities', //اسم المدينة متغير
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
              SizedBox(
                height: 800,
                child: GridView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(name: "/cityPage"),
                                builder: (context) => City_Pages_module(
                                    cityName: docCity[index]['Name'],
                                    cityDiscrption: docCity[index]['DesCrption'],
                                    cityImage: docCity[index]['Images'] )));
                      },
                      child: stackForGridView(
                          imageName: CachedNetworkImageProvider(imageCity[index][0]),
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
            ),
          );
        },

      ),
    );
  }
}
