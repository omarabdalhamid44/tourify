
import 'package:flutter/material.dart';
import 'package:xdd/utils/Models/dataCategory.dart';
import 'package:xdd/utils/VeriableConst/imagesAsset_.dart';
import 'package:xdd/utils/Widgets/stack_catagories_Place.dart';

class grid_forCityPlace extends StatelessWidget {
  List<DataCategory> assetImageName;
int count = 0;

  grid_forCityPlace({required this.assetImageName , this.count = 5});

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
    ), itemCount: count
        ,itemBuilder:(context , index){
      return Stack_catogries_place(
        namePlace:assetImageName[index].namePalce ,
        image_place: assetImageName[index].image,
      );
    });

  }
}
