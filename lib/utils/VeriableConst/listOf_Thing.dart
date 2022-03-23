import 'package:flutter/material.dart';
import 'package:xdd/screens/mainScreens/CitiesScreens/city_page.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';

class ListOfThings {
  static const list_of_countries = <String>[
    '🇵🇸 Palestine',
    '🇯🇴 Jordan',
    '🇺🇸 USA',
    '🇪🇬 Egept',
    '🇸🇦 SoudiAribia'
  ];
  static const list_of_price = <String>[
  '00 \$',
  '05 \$',
  '10 \$',
  '20 \$',
  '30 \$',
  '40 \$',
  '50 \$',
  ];
  static const list_of_number = <String>[
    '🇵🇸 00972',
    '🇺🇸 001',
    '🇯🇴 0096',
    '🇪🇬 0055',
    '🇸🇦 54'
  ];
  static const list_of_gender = <String>['Male', 'FeMale'];
  static List<City_Pages_module> list_of_citiesPage = [
    City_Pages_module(
        cityName: 'jureslem',
        cityDiscrption:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you.',
        cityInfo:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.'),
    City_Pages_module(
        cityName: 'gaza',
        cityDiscrption:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you.',
        cityInfo:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.'),
    City_Pages_module(
        cityName: 'yaffa',
        cityDiscrption:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you.',
        cityInfo:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.'),
    City_Pages_module(
        cityName: 'ramallah',
        cityDiscrption:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you.',
        cityInfo:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.'),
    City_Pages_module(
        cityName: 'hiffa',
        cityDiscrption:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you.',
        cityInfo:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.'),
    City_Pages_module(
        cityName: 'taparaia',
        cityDiscrption:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you.',
        cityInfo:
            'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.'),
  ];
}
