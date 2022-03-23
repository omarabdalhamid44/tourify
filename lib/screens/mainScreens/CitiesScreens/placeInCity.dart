import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/imagesAsset_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';

class PlaceInCity extends StatefulWidget {
  const PlaceInCity({Key? key}) : super(key: key);

  @override
  State<PlaceInCity> createState() => _PlaceInCityState();
}

class _PlaceInCityState extends State<PlaceInCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors_APP.color_primary,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,

        actions: [
          IconButton(
            onPressed: () {},
            icon: imageIcon.heartIcon,
            color: Colors_APP.color_primary,
          ),
          IconButton(
            onPressed: () {},
            icon: imageIcon.notifiIcon,
            color: Colors_APP.color_primary,
          )
        ],
      ),
body : Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      Styles_App(text: 'PlaceName'.toUpperCase(), fontWeight: FontWeight.bold,fontSize: 20),

      SizedBox(height: SizeConfig.scaleHeight(20)),

      CircleAvatar(
        radius: 50,
  backgroundImage: AssetImage(imagesAsset_.image_Places.elementAt(2)),
        // child: Image(
        //
        //   image: AssetImage(imagesAsset_.image_Places.elementAt(2)),
        //
        //   height: SizeConfig.scaleHeight(100),
        //
        //   width: SizeConfig.scaleWidth(100),
        //
        //   fit: BoxFit.cover,
        //
        // ),

      ),

      SizedBox(height: SizeConfig.scaleHeight(10)),

      Styles_App(text: 'PlaceName'.toUpperCase(), fontWeight: FontWeight.bold,fontSize: 15),

      SizedBox(height: SizeConfig.scaleHeight(15)),

      Row(

        children: [

          Icon(Icons.star, color: Color(0xffF9CD1B)),

          Icon(Icons.star, color: Color(0xffF9CD1B)),

          Icon(Icons.star, color: Color(0xffF9CD1B)),

          Icon(Icons.star, color: Color(0xffF9CD1B)),

          Icon(Icons.star_half_outlined, color: Color(0xffF9CD1B)),

        ],

      ),

      SizedBox(height: SizeConfig.scaleHeight(15)),

      Styles_App(text: 'It is important for us at Sbitany to make the purchasing process as easy as possible .', fontWeight: FontWeight.bold,fontSize: 15),

      SizedBox(height: SizeConfig.scaleHeight(15)),

      ElevatedButton(

        onPressed: (){},

        child:  Row(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

              Icon(Icons.location_on_outlined)

            ,Styles_App(text: 'map'.toUpperCase(), fontWeight: FontWeight.bold,fontSize: 15),

          ],

        ),

      ),



    ],

  ),
)
    );
  }
}
