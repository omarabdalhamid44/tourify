
// ignore_for_file: non_constant_identifier_names, file_names, camel_case_types

import 'package:xdd/utils/Models/dataCategory.dart';

class imagesAsset_{
 static List<String> Image_Cities = [
    'images/Quds.png',
    'images/gaza.png',
    'images/yaffa.png',
    'images/ramallah.png',
    'images/hifa.png',
    'images/tabaria.png'
  ];
 static List<String> image_Places = [
    'images/placeImage/place_gaza/basher.jpg',
    'images/placeImage/place_gaza/bb.jpg',
    'images/placeImage/place_gaza/sea.jpg',
    'images/placeImage/place_gaza/qalaa.jpg',
    'images/placeImage/place_gaza/museim.jfif',
  ];
 static List<DataCategory> Religious =[

    DataCategory(image: image_Places.elementAt(4) , namePalce: 'Al-Omari Museim'),
 ];
 static List<DataCategory> Historical =[

    DataCategory(image: image_Places.elementAt(3) , namePalce: 'Qalaa Barqoq'),
 ];
 static List<DataCategory> Entertaining =[
    DataCategory(image: image_Places.elementAt(0) , namePalce: 'Al-Basher City'),
    DataCategory(image: image_Places.elementAt(1) , namePalce: 'Bessan City'),
    DataCategory(image: image_Places.elementAt(2) , namePalce: 'Sea Gaza'),

 ];
  // List<String> Image_Persons = [
  //   'images/personImage/person1.jpg',
  //   'images/Quds.png',
  //   'images/yaffa.png',
  //   'images/ramallah.png',
  //   'images/hifa.png',
  //   'images/tabaria.png'
  // ];
  // List<String> Image_Stories = [
  //   'images/placeImage/story1.jpg',
  //   'images/Quds.png',
  //   'images/yaffa.png',
  //   'images/ramallah.png',
  //   'images/hifa.png',
  //   'images/tabaria.png'
  // ];
}