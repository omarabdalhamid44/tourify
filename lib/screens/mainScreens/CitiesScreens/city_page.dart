import 'package:flutter/material.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/Widgets/grid_city_place.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/Widgets/imageViewInHome.dart';
import 'package:xdd/utils/VeriableConst/imagesAsset_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/Widgets/wether_condation_widget.dart';
import 'package:xdd/utils/sizeconfig.dart';

class City_Pages_module extends StatefulWidget {
 final String cityName;
 final String cityDiscrption;
 final String cityInfo;

   City_Pages_module({
   required this.cityName,
   required this.cityDiscrption,
   required this.cityInfo});

  @override
  _City_Pages_moduleState createState() => _City_Pages_moduleState();
}

class _City_Pages_moduleState extends State<City_Pages_module> {
  late PageController _pageViewController;
  late PageController _pageViewCatogriesController;
  int _curent_image = 0;
  int _curent_Catogry = 0;

  @override
  void initState() {
    _pageViewController = PageController();
    _pageViewCatogriesController = PageController();
    super.initState();
    // TODO: implement initState
  }
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _pageViewCatogriesController.dispose();
  //   _pageViewController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors_APP.color_primary),
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles_App(
                text: widget.cityName.toUpperCase(), //اسم المدينة متغير
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              SizedBox(height: 10),
              Styles_App(
                text: widget.cityDiscrption, //وصف المدينة متغير
                fontWeight: FontWeight.w400,
                fontSize: 11,
                textColor: Color(0xff303030),
              ),
              SizedBox(height: 20),
              Container(
                  height: SizeConfig.scaleHeight(180),
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemBuilder: (context , index){
                          return ImageView_HomePage(
                              imageName: imagesAsset_.Image_Cities.elementAt(index));
                        },
                        itemCount: imagesAsset_.Image_Cities.length,
                        controller: _pageViewController,
                        onPageChanged: (int cruentImage) {
                          setState(() {
                            _curent_image = cruentImage;
                          });
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.5)
                              ],
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomStart),
                        ),
                      ),
                      Positioned(
                          left: SizeConfig.scaleWidth(250),
                          right: SizeConfig.scaleWidth(50),
                          top: SizeConfig.scaleHeight(130),
                          bottom: SizeConfig.scaleHeight(2),
                          child: IconButton(
                            onPressed: () {
                              _pageViewController.previousPage(
                                  duration: Duration(seconds: 2),
                                  curve: Curves.easeOut);
                            },
                            icon: _curent_image == 0
                                ? imageIcon.leftIcon
                                : imageIcon.left2Icon,
                            color:
                                _curent_image == 0 ? Colors.grey : Colors.white,
                          )),
                      Positioned(
                        left: SizeConfig.scaleWidth(300),
                        right: SizeConfig.scaleWidth(2),
                        top: SizeConfig.scaleHeight(130),
                        bottom: SizeConfig.scaleHeight(2),
                        child: IconButton(
                          onPressed: () {
                            _pageViewController.nextPage(
                                duration: Duration(seconds: 2),
                                curve: Curves.easeIn);
                          },
                          icon: _curent_image == 5
                              ? imageIcon.right2Icon
                              : imageIcon.rightIcon,
                          color:
                              _curent_image == imagesAsset_.Image_Cities.length
                                  ? Colors.grey
                                  : Colors.white,
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 10),
              Styles_App(
                text: 'Weather Condition',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              SizedBox(height: 20),
              WeatherCondationWidget( cityName: widget.cityName,),
              SizedBox(height: 20),
              Styles_App(
                text: '${widget.cityName.toUpperCase()} Info', // اسم المدينة متغير
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              SizedBox(height: 10),
              Styles_App(
                text: widget.cityInfo,//متغيير معلومات المدينة
                    // 'It is important for us at Sbitany to make the purchasing process as easy as possible for you. For that reason we have created a few buying guides to help guide you before making your decision.',
                fontWeight: FontWeight.w400,
                fontSize: 13,
                textColor: Color(0xff303030),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _curent_Catogry = 0;
                            _pageViewCatogriesController.jumpToPage(0);
                          });
                        },
                        child: Text('All'),
                        style: ElevatedButton.styleFrom(
                          primary: _curent_Catogry == 0
                              ? Colors_APP.color_primary
                              : Color(0xffEFEFEF),
                          onPrimary: _curent_Catogry != 0
                              ? Colors_APP.color_primary
                              : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 30,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          shape: BoxShape.rectangle),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _curent_Catogry = 1;
                            _pageViewCatogriesController.jumpToPage(1);
                          });
                        },
                        child: Text('Religious'),
                        style: ElevatedButton.styleFrom(
                          primary: _curent_Catogry == 1
                              ? Colors_APP.color_primary
                              : Color(0xffEFEFEF),
                          onPrimary: _curent_Catogry != 1
                              ? Colors_APP.color_primary
                              : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _curent_Catogry = 2;
                            _pageViewCatogriesController.jumpToPage(2);
                          });
                        },
                        child: Text('Historical'),
                        style: ElevatedButton.styleFrom(
                          primary: _curent_Catogry == 2
                              ? Colors_APP.color_primary
                              : Color(0xffEFEFEF),
                          onPrimary: _curent_Catogry != 2
                              ? Colors_APP.color_primary
                              : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _curent_Catogry = 3;
                            _pageViewCatogriesController.jumpToPage(3);
                          });
                        },
                        child: Text('Entertaining'),
                        style: ElevatedButton.styleFrom(
                          primary: _curent_Catogry == 3
                              ? Colors_APP.color_primary
                              : Color(0xffEFEFEF),
                          onPrimary: _curent_Catogry != 3
                              ? Colors_APP.color_primary
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 800,
                  margin: EdgeInsets.only(top: 20),
                  child: PageView(
                    controller: _pageViewCatogriesController,
                    onPageChanged: (int _pageCatgory) {
                      setState(() {
                        _pageCatgory = _curent_Catogry;
                      });
                    },
                    children: [
                      grid_forCityPlace(
                        assetImageName: imagesAsset_.Religious +
                            imagesAsset_.Historical +
                            imagesAsset_.Entertaining,
                      ),
                      grid_forCityPlace(
                        assetImageName: imagesAsset_.Religious,
                        count: imagesAsset_.Religious.length,
                      ),
                      grid_forCityPlace(
                          assetImageName: imagesAsset_.Historical,
                          count: imagesAsset_.Historical.length),
                      grid_forCityPlace(
                          assetImageName: imagesAsset_.Entertaining,
                          count: imagesAsset_.Entertaining.length),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
