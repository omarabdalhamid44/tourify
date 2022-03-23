import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/Widgets/citiesScreen.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';

class CitiesCollectionScreen extends StatelessWidget {
  const CitiesCollectionScreen({Key? key}) : super(key: key);

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

      body: SingleChildScrollView(
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
              pageCitiesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
