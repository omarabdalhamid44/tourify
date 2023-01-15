import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/screens/BnScreens/mapsScreen/MapScreen.dart';
import 'package:xdd/screens/story_pages/storyView.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/imagesAsset_.dart';
import 'package:xdd/utils/Widgets/imageView.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';

import '../../../utils/Models/Story.dart';

class PlaceInCity extends StatefulWidget {
  String namePlace;
  String? catgory;
  List images;
  String des;
  String rate;
  String contact;

  PlaceInCity({required this.namePlace,required  this.images,required  this.des,required  this.rate,this.contact='',this.catgory});

  @override
  State<PlaceInCity> createState() => _PlaceInCityState();
}

class _PlaceInCityState extends State<PlaceInCity> {
  @override
  Widget build(BuildContext context) {
    bool visble = widget.catgory == 'PlaceOfEntertainment';

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors_APP.color_primary,
        ),
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles_App(
                  text: widget.namePlace.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              SizedBox(height: SizeConfig.scaleHeight(5)),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:
                  CachedNetworkImageProvider(widget.images[0]),

                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Center(
                child: Styles_App(
                    text: widget.namePlace.toUpperCase(),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Container(
                padding: EdgeInsets.only(left: 130),
                  child: widget.rate.toString() == '1'
                      ? Row(
                    children: [
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                    ],
                  )
                      : widget.rate.toString() == '2'
                      ? Row(
                    children: [
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                    ],
                  )
                      : widget.rate.toString() == '3'
                      ? Row(
                    children: [
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                    ],
                  )
                      : widget.rate.toString() == '4'
                      ? Row(
                    children: [
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.grey),
                    ],
                  )
                      : Row(
                    children: [
                      Icon(FlutterIcons.star_o_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.amberAccent),
                      Icon(FlutterIcons.star_o_faw,color: Colors.amberAccent),
                    ],
                  )),

              SizedBox(height: SizeConfig.scaleHeight(8)),
              Row(
                mainAxisAlignment: visble? MainAxisAlignment.spaceAround:MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MapScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          imageIcon.locationIcon,
                          SizedBox(
                            width: 7,
                          ),
                          Styles_App(
                            text: 'Map',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          maximumSize: Size(visble?155:double.infinity, 45),
                          primary: Colors_APP.color_primary),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Visibility(
                    visible: visble,
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 293,
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
                                    SizedBox(height: SizeConfig.scaleHeight(15)),
                                    Styles_App(
                                        text: 'Contact Us',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    SizedBox(height: SizeConfig.scaleHeight(20)),
                                    Row(
                                      children: [
                                       Icon(FlutterIcons.ios_call_ion),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        TextButton(
                                          onPressed: ()async {
                                          await  _makePhoneCall(widget.contact);
                                          },
                                          child: Styles_App(
                                            text: widget.contact,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            textColor: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: SizeConfig.scaleHeight(1)),

//*********\
                                  ]),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            imageIcon.callingIcon,
                            SizedBox(
                              width: 7,
                            ),
                            Styles_App(
                              text: 'Contact Us',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            maximumSize: Size(165, 45),
                            primary: Colors_APP.color_primary),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Styles_App(
                text: 'your story'.toUpperCase(),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                textColor: Colors_APP.color_primary,
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _addNewStoryButton(),
                    ...[
                      for (Story story in storiesList)
                        _currentStoriesList(
                            assetName: story.imagePath, context: context),
                    ]
                  ],
                ),
              ),
              SizedBox(height: 0),
              Styles_App(
                text: 'about Place'.toUpperCase(),
                fontWeight: FontWeight.bold,
                fontSize: 18,
                textColor: Colors_APP.color_primary,
              ),
              SizedBox(height: 4),
              Styles_App(
                text:widget.des,
                fontWeight: FontWeight.normal,
                fontSize: 15,
                textColor: Colors.black,
              ),
              SizedBox(height: 20),
              Styles_App(
                text: 'images 360`'.toUpperCase(),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                textColor: Colors.black,
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 309,
                                  height: 175,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black,
                                      // image: DecorationImage( 'images/placeImage/story8.jpg'),
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            widget.images[index],
                                          ),
                                          fit: BoxFit.fill)),
                                  // child: Image(image:AssetImage( 'images/placeImage/story8.jpg')),
                                ),
                                Positioned(
                                  top: 50,
                                  bottom: 50,
                                  left: 124,
                                  right: 124,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageView(image: widget.images[index])));
                                    },
                                    child: CircleAvatar(
                                      radius: 28.5,
                                      backgroundColor: Colors_APP.color_primary,
                                      child: imageIcon.degree360Icon,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _addNewStoryButton() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 10, bottom: 17),
          height: 65,
          width: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 28.5,
            backgroundColor: Colors_APP.color_primary,
            child: imageIcon.uploadIcon,
          ),
        ),
      ),
    ],
  );
}

Widget _currentStoriesList({required String assetName, BuildContext? context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context!,
              MaterialPageRoute(
                  builder: (context) => Story_Page_View(
                        imageStory: assetName,
                        imagePerson: '',
                        NamePerson: 'hrhr',
                      )));
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10, bottom: 17),
          height: 65,
          width: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 28.5,
            foregroundImage: AssetImage(assetName),
          ),
        ),
      ),
    ],
  );
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}


