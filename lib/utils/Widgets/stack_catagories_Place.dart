// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, camel_case_types, must_be_immutable, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:xdd/databaseManage/databaseManage.dart';
import 'package:xdd/screens/BnScreens/CitiesScreens/placeInCity.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';

class Stack_catogries_place extends StatefulWidget {
  String namePlace;
String catgoryPlace;
String contact;
  List image_place;

  String rate;
  String des;
  bool fav = false;
  int index;

  Stack_catogries_place(
      {Key? key,
      required this.image_place,
      required this.namePlace,
      required this.rate,
      required this.des,
      required this.catgoryPlace,
      required this.fav,
      required this.index,
       this.contact=''

      })
      : super(key: key);

  @override
  State<Stack_catogries_place> createState() => _Stack_catogries_placeState();
}

class _Stack_catogries_placeState extends State<Stack_catogries_place> {
  List dataFav = [];

  DatabaseUser dbUser = DatabaseUser();
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Image(
              image: CachedNetworkImageProvider(widget.image_place[0]),
              width: SizeConfig.scaleWidth(166),
              height: SizeConfig.scaleHeight(204),
              fit: BoxFit.cover,
            )),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlaceInCity(
                          namePlace: widget.namePlace,
                          rate: widget.rate,
                          images: widget.image_place,
                          des: widget.des,
                      catgory: widget.catgoryPlace,
                      contact: widget.contact,
                        )));
          },
          child: Container(
            width: SizeConfig.scaleWidth(166),
            height: SizeConfig.scaleHeight(204),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      color: Colors.black38)
                ]),
          ),
        ),
        Positioned(
          top: SizeConfig.scaleHeight(5),
          right: SizeConfig.scaleWidth(20),
          left: SizeConfig.scaleWidth(125),
          bottom: SizeConfig.scaleHeight(156),
          child: InkWell(
            onTap: () async {
              setState(() {
                widget.fav = !widget.fav;

              });
              if(widget.fav==true){
                setState(() {
                  dataFav =dataFav+[{
                    'NamePlace':widget.namePlace,
                    'DesCrption':widget.des,
                    'Images':widget.image_place,
                    'Rate':widget.rate
                  }];
                });
                await dbUser.createFav(widget.catgoryPlace,dataFav);
              }else{

                await dbUser.deleteFav(widget.catgoryPlace,dataFav);

              }




            },
            child: Container(
              height: SizeConfig.scaleHeight(28),
              width: SizeConfig.scaleWidth(28),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Center(
                  child: widget.fav ? imageIcon.heartFillIcon : imageIcon.heartIcon),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Styles_App(
                text: widget.namePlace,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                textColor: Colors.white,
              ),
              SizedBox(height: 3),
              Container(
                  child: widget.rate.toString() == '1'
                      ? Row(
                          children: [
                            Icon(FlutterIcons.star_faw,
                                color: Colors.amberAccent),
                            Icon(FlutterIcons.star_o_faw, color: Colors.grey),
                            Icon(FlutterIcons.star_o_faw, color: Colors.grey),
                            Icon(FlutterIcons.star_o_faw, color: Colors.grey),
                            Icon(FlutterIcons.star_o_faw, color: Colors.grey),
                            SizedBox(width: 5),
                            Styles_App(
                              text: widget.rate,
                              fontWeight: FontWeight.normal,
                              textColor: Colors.white,
                            )
                          ],
                        )
                      : widget.rate.toString() == '2'
                          ? Row(
                              children: [
                                Icon(FlutterIcons.star_faw,
                                    color: Colors.amberAccent),
                                Icon(FlutterIcons.star_faw,
                                    color: Colors.amberAccent),
                                Icon(FlutterIcons.star_o_faw,
                                    color: Colors.grey),
                                Icon(FlutterIcons.star_o_faw,
                                    color: Colors.grey),
                                Icon(FlutterIcons.star_o_faw,
                                    color: Colors.grey),
                                SizedBox(width: 5),
                                Styles_App(
                                  text: widget.rate,
                                  fontWeight: FontWeight.normal,
                                  textColor: Colors.white,
                                )
                              ],
                            )
                          : widget.rate.toString() == '3'
                              ? Row(
                                  children: [
                                    Icon(FlutterIcons.star_faw,
                                        color: Colors.amberAccent),
                                    Icon(FlutterIcons.star_faw,
                                        color: Colors.amberAccent),
                                    Icon(FlutterIcons.star_faw,
                                        color: Colors.amberAccent),
                                    Icon(FlutterIcons.star_o_faw,
                                        color: Colors.grey),
                                    Icon(FlutterIcons.star_o_faw,
                                        color: Colors.grey),
                                    SizedBox(width: 5),
                                    Styles_App(
                                      text: widget.rate,
                                      fontWeight: FontWeight.normal,
                                      textColor: Colors.white,
                                    )
                                  ],
                                )
                              : widget.rate.toString() == '4'
                                  ? Row(
                                      children: [
                                        Icon(FlutterIcons.star_faw,
                                            color: Colors.amberAccent),
                                        Icon(FlutterIcons.star_faw,
                                            color: Colors.amberAccent),
                                        Icon(FlutterIcons.star_faw,
                                            color: Colors.amberAccent),
                                        Icon(FlutterIcons.star_faw,
                                            color: Colors.amberAccent),
                                        Icon(FlutterIcons.star_o_faw,
                                            color: Colors.grey),
                                        SizedBox(width: 5),
                                        Styles_App(
                                          text: widget.rate,
                                          fontWeight: FontWeight.normal,
                                          textColor: Colors.white,
                                        )
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Icon(FlutterIcons.star_o_faw,
                                            color: Colors.amberAccent),
                                        Icon(FlutterIcons.star_o_faw,
                                            color: Colors.amberAccent),
                                        Icon(FlutterIcons.star_o_faw,
                                            color: Colors.amberAccent),
                                        Icon(FlutterIcons.star_o_faw,
                                            color: Colors.amberAccent),
                                        Icon(FlutterIcons.star_o_faw,
                                            color: Colors.amberAccent),
                                        SizedBox(width: 5),
                                        Styles_App(
                                          text: widget.rate,
                                          fontWeight: FontWeight.normal,
                                          textColor: Colors.white,
                                        )
                                      ],
                                    )),
            ],
          ),
        ),
      ],
    );
  }
}
