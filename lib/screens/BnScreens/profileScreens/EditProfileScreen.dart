import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xdd/databaseManage/databaseManage.dart';
import 'package:xdd/screens/BnScreens/mainScreens/Notifications.dart';
import 'package:xdd/screens/BnScreens/mainScreens/feverateScreen.dart';
import 'package:xdd/utils/Helpers.dart';
import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/VeriableConst/variables.dart';
import 'package:xdd/utils/Widgets/profileWid.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({
    required this.db,
    required this.fullName,
    required this.uid,
    required this.email,
    required this.numberPhone,
    required this.country,
    required this.city,
    required this.bithday,
    required this.image,
  });

  DatabaseUser? db;

  String fullName;
  String uid;
  String email;
  String numberPhone;
  String country;
  String city;
  String bithday;
  String image;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DatabaseUser db = DatabaseUser();

  TextEditingController? _nameEditingController;
  TextEditingController? _emailEditingController;
  TextEditingController? _numberPhoneEditingController;
  TextEditingController? _countreEditingController;
  TextEditingController? _locationEditingController;

  final ImagePicker _picker = ImagePicker(); // اوبجيكت لرفع الصور
  File? file; // ملف لعرض الصور
  String downloadUrl = '';
  XFile? image;

  @override
  void initState() {
    // TODO: implement initState
    _nameEditingController = TextEditingController(text: widget.fullName);
    _emailEditingController = TextEditingController(text: widget.email);
    _numberPhoneEditingController =
        TextEditingController(text: widget.numberPhone);
    _countreEditingController = TextEditingController(text: widget.country);
    _locationEditingController = TextEditingController(text: widget.city);
    downloadUrl = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF8F8F8),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors_APP.color_primary),
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
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles_App(
                  text: 'profile'.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                SizedBox(
                  height: 5,
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 101,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/bkProfile.png'),
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors_APP.color_primary,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 20,
                      right: 171,
                      bottom: 50,
                      child: Styles_App(
                        text: _nameEditingController!.text,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        textColor: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      right: 241,
                      bottom: 30,
                      child: Styles_App(
                        text: widget.bithday,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        textColor: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: 2,
                      left: 300,
                      bottom: 10,
                      child: Container(
                        // alignment: Alignment.centerLeft,
                        width: SizeConfig.scaleWidth(50),
                        height: SizeConfig.scaleHeight(50),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(downloadUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Stack(children: [
                        Container(
                          color: Colors.transparent,
                          width: double.infinity,
                          height: 65,
                        ),
                        Positioned(
                          left: 40,
                          right: 0,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            width: 250,
                            height: 65,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        Positioned(
                            top: 15,
                            right: 5,
                            left: 270,
                            bottom: 15,
                            child: ElevatedButton(
                              onPressed: () async {
                                await pickPhotoFromGallery();
                                await upload();
                              },
                              child: Row(
                                children: [
                                  Icon(FlutterIcons.create_mdi,
                                      color: Colors.black),
                                  Styles_App(
                                    text: 'Change ',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    textColor: Colors.black,
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(100, 100),
                                  primary: Colors.lightBlueAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            )),
                        Positioned(
                            bottom: 10,
                            right: 300,
                            left: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors_APP.color_primary,
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: imageIcon.imageProfileIcon,
                                  color: Colors.white,
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                ),
                              ),
                            )),
                        Positioned(
                            bottom: 20,
                            right: 60,
                            left: 70,
                            child: Styles_App(
                              fontWeight: FontWeight.normal,
                              text: 'image!.name.substring(12)}',
                              fontSize: 12,
                              textColor: Colors.black,
                            ))
                      ]),
                    ),
                    ProfileWid(
                      image: imageIcon.messageIcon,
                      isEdit: true,
                      textEditingController: _emailEditingController,
                    ),
                    ProfileWid(
                      image: imageIcon.callingIcon,
                      isEdit: true,
                      textEditingController: _numberPhoneEditingController,
                    ),
                    ProfileWid(
                      image: imageIcon.infoIcon,
                      isEdit: true,
                      textEditingController: _countreEditingController,
                    ),
                    ProfileWid(
                      image: imageIcon.locationIcon,
                      isEdit: true,
                      textEditingController: _locationEditingController,
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        widget.db!.update(
                          mobileNumber: _numberPhoneEditingController!.text,
                            id: widget.uid.trimLeft(),
                            email: _emailEditingController!.text,
                            imageProfile: downloadUrl,
                            country: _countreEditingController!.text,
                            city: _locationEditingController!.text);
                        Helpers.showSnackBar(context, 'Updated Data Done');
                        Navigator.pop(context);

                      },
                      child: Styles_App(
                        text: 'Save',
                        fontWeight: FontWeight.w600,
                        textColor: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors_APP.color_primary,
                        minimumSize: Size(double.infinity, 55),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  pickPhotoFromGallery() async {
    // تجلب الصور وتخزنهم ف الليست
    image = await _picker.pickImage(source: ImageSource.gallery);
  }

  upload() async {
    // ترفع الصور
    await uplaodImageAndSaveItemInfo();
  }

  Future<String> uplaodImageAndSaveItemInfo() async {
    // ترفع الصور وتحفظهم ف الليست

    PickedFile? pickedFile;
    file = File(image!.path);
    pickedFile = PickedFile(file!.path);
    uploadImageToStorge(pickedFile, _nameEditingController!.text);

    return 'ImagesId';
  }

  uploadImageToStorge(PickedFile? pickedFile, String imageid) async {
    // فنكشن ترفع الصور الى فاير بيز ستورج
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('Users' + '/$imageid/profileImage');
    var ref = await reference.putData(await pickedFile!.readAsBytes(),
        SettableMetadata(contentType: 'image/jpeg'));

    String value = await reference.getDownloadURL();
    downloadUrl = value;
  }
}
