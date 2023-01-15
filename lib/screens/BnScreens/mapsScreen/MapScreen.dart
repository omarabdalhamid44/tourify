import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/Helpers.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var markersPlace = HashSet<Marker>();
  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Stack(
        children: [

          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(31.952162, 35.23315400000001),
                zoom: 8.40
            ),
            onMapCreated: (googleMapController) {
              setState(() {
                markersPlace.add(Marker(markerId: MarkerId('1'),
                    position: LatLng(31.548248, 34.456137),
                     onTap: (){
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,

                        builder: (context) {
                          return Container(
                            height: 400,
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
                                        height: SizeConfig.scaleHeight(20)),
                                  ListTile(
                                    leading:   Image(
                                        height: 90,
                                        width: 90,
                                        image: AssetImage('images/placeImage/story1.jpg')),
                                    title: Text('drfg'),
                                    subtitle: Text('gdfgdf'),
                                  ), //معلومات المكان السياحي
                                    SizedBox(
                                        height: SizeConfig.scaleHeight(20)),
                                    Container(
                                      height: 150,
                                      child: ListView(
                                        children: [
                                            Text('gfdhg')
                                        ],
                                      ),
                                    )
                                  ])
                              )
                          );
                        });
                  },

                ));
              });
            },
            markers: markersPlace,

          ), Container(
              width: 433,
              height: 150,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft
                  )
              ),
              child: Styles_App(
                  fontSize: 20,
                  text: 'MAP APP', fontWeight: FontWeight.bold)),



        ],
      ),
    );
  }
}
