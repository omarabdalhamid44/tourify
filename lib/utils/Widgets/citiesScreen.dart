import 'package:flutter/material.dart';
import 'package:xdd/screens/mainScreens/CitiesScreens/city_page.dart';
import 'package:xdd/utils/VeriableConst/imagesAsset_.dart';
import 'package:xdd/utils/VeriableConst/listOf_Thing.dart';
import 'package:xdd/utils/Widgets/stackForGridView.dart';
import 'package:xdd/utils/sizeconfig.dart';

class pageCitiesWidget extends StatelessWidget {
  List<stackForGridView> listOfCities = [
    stackForGridView(
        imageName: imagesAsset_.Image_Cities.elementAt(0),
        cityName: 'Jersulem',
        descrption: 'This Is Jersulem City'),
    stackForGridView(
        imageName: imagesAsset_.Image_Cities.elementAt(1),
        cityName: 'GAZA',
        descrption: 'This Is Gaza City'),
    stackForGridView(
        imageName: imagesAsset_.Image_Cities.elementAt(2),
        cityName: 'Yaffa'.toUpperCase(),
        descrption: 'This Is Yaffa City'),
    stackForGridView(
        imageName: imagesAsset_.Image_Cities.elementAt(3),
        cityName: 'Ramallah'.toUpperCase(),
        descrption: 'This Is Ramallah City'),
    stackForGridView(
        imageName: imagesAsset_.Image_Cities.elementAt(4),
        cityName: 'Hiffa'.toUpperCase(),
        descrption: 'This Is Hiffa City'),
    stackForGridView(
        imageName: imagesAsset_.Image_Cities.elementAt(5),
        cityName: 'Tabaria'.toUpperCase(),
        descrption: 'This Is Tabaria City'),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          cityName: ListOfThings.list_of_citiesPage
                              .elementAt(index)
                              .cityName,
                          cityDiscrption: ListOfThings.list_of_citiesPage
                              .elementAt(index)
                              .cityDiscrption,
                          cityInfo: ListOfThings.list_of_citiesPage
                              .elementAt(index)
                              .cityInfo)));
            },
            child: stackForGridView(
                imageName: listOfCities.elementAt(index).imageName,
                cityName: listOfCities.elementAt(index).cityName,
                descrption: listOfCities.elementAt(index).descrption),
          );
        },
        physics: NeverScrollableScrollPhysics(),
        itemCount: listOfCities.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              SizeConfig.scaleWidth(155) / SizeConfig.scaleHeight(180),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: SizeConfig.scaleHeight(230),
        ),
      ),
    );
  }
}
