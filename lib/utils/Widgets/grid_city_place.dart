
// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:xdd/utils/Models/dataCategory.dart';
import 'package:xdd/utils/Widgets/stack_catagories_Place.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

class Grid_ForCityPlace extends StatelessWidget {
  List assetImageName;
  List images;
  String catgory;
int count = 0;
bool fav;
  Grid_ForCityPlace({required this.assetImageName ,required this.count,required this.images,this.fav=false,this.catgory=''});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 155 / 210,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      mainAxisExtent: 210,
    ), itemCount: assetImageName.length
        ,itemBuilder:(context , index){
          return Stack_catogries_place(
            contact: catgory=='PlaceOfEntertainment'?assetImageName[index]['contact']:'',
            index: index,
            catgoryPlace: catgory,
            fav: fav ,
            namePlace:assetImageName[index]['NamePlace'] ,
            rate: assetImageName[index]['Rate'],
            image_place: images[index],
            des: assetImageName[index]['DesCrption'],
          );

    });

  }
}
