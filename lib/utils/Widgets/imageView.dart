import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  String image;

  ImageView({required this.image});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image:  CachedNetworkImageProvider(widget.image),
              fit: BoxFit.contain,

            ),
          ),
          Positioned(
            right: 10,
            top: 40,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.cancel,color: Colors.black,size: 40,)),
          )
        ],
      ),
    );
  }
}
