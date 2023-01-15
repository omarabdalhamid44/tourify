import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xdd/utils/Models/Mass.dart';

import 'package:xdd/utils/VeriableConst/colors.dart';
import 'package:xdd/utils/VeriableConst/imageIcon_.dart';
import 'package:xdd/utils/Widgets/styles_App.dart';
import 'package:xdd/utils/sizeconfig.dart';


class shatScreen3 extends StatelessWidget {
  const shatScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors_APP.color_primary,
        ),
        title: ListTile(
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage:
                AssetImage('images/personImage/person8.jpg'),
              ),
              Positioned(
                right: 0,
                bottom: 33,
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color:
                        Theme.of(context).scaffoldBackgroundColor,
                        width: 3),
                  ),
                ),
              )
            ],
          ),
          title: Styles_App(
              text: 'Jenny Wilson',
              fontWeight: FontWeight.bold,
              fontSize: 16),
          subtitle:  Styles_App(
              text: 'online',
              fontWeight: FontWeight.normal,
              fontSize: 14),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20.0 * 0.75),
         child:  Column(
           children: [
             SizedBox(
                     height: 700,
                     child: ListView.builder(
                      itemCount: messages.length,
                      shrinkWrap: true,
                      padding:  const EdgeInsets.only(top: 10, bottom: 10),
                      itemBuilder: (context, index) {
                        bool isMe = messages[index].messageType =="sender";
                        return Container(
                          padding: const EdgeInsets.only(
                              left: 2, right: 14, top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment:
                                (messages[index].messageType == "receiver"
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.end),
                            children: [
                              if(!isMe)
                               const CircleAvatar(
                                radius: 24,
                                backgroundImage:
                                    AssetImage('images/personImage/person8.jpg'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Align(
                                alignment: (messages[index].messageType == "receiver"
                                    ? Alignment.topLeft
                                    : Alignment.topRight),
                                child: Column(
                                  crossAxisAlignment:
                                      (messages[index].messageType == "receiver"
                                          ? CrossAxisAlignment.start
                                          : CrossAxisAlignment.end),
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(20),
                                            topRight: const Radius.circular(20),
                                            bottomLeft: Radius.circular(
                                                (messages[index].messageType ==
                                                        "receiver"
                                                    ? -20
                                                    : 20)),
                                            bottomRight: Radius.circular(
                                                (messages[index].messageType ==
                                                        "receiver"
                                                    ? 20
                                                    : -20))),
                                        color:
                                            (messages[index].messageType == "receiver"
                                                ? Colors.white
                                                : Colors_APP.color_primary),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        messages[index].messageContent,
                                        style: TextStyle(
                                            color: (messages[index].messageType ==
                                                    "receiver"
                                                ? Colors.black
                                                : Colors.white),
                                            fontSize: 14),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.done_all,
                                            size: 20, color: Colors.grey),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Styles_App(
                                          text: '10:00 PM',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                          textColor: Colors.black,
                                        ),
                                      ],
                                    ),

                                  ],

                                ),
                              ),
                            ],
                          ),
                        );
                      },
                  ),
                   ),

             Container(
               padding:  const EdgeInsets.symmetric(
                 horizontal: 5,
                 vertical: 20.0 / 2,
               ),
               decoration: const BoxDecoration(
                 color: Colors.transparent,
               ),
               child: Row(
                 children: [

                    PopupMenuButton<Widget>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                      color: Colors_APP.color_bg_lanach_sc,
                      // iconSize: 20,
                   // padding: EdgeInsets.symmetric(horizontal: -50),
                      child: CircleAvatar(
                        child: Icon(Icons.add),
                      ),
                      offset: Offset(5,-170),

                      itemBuilder: (context){
                        return[

                          PopupMenuItem(padding: EdgeInsets.symmetric(horizontal: 0),
                              child: Column(
                                children: [
                                  IconButton(onPressed: (){},icon: Icon(Icons.add,size: 20,)),
                                  IconButton(onPressed: (){},icon: Icon(Icons.add,size: 20,)),
                                  IconButton(onPressed: (){},icon: Icon(Icons.add,size: 20,)),
                                ],
                              )),

                          // PopupMenuItem(padding: EdgeInsets.symmetric(horizontal: 0),child: IconButton(onPressed: (){},icon: Icon(Icons.add,size: 20,))),
                          // PopupMenuItem(padding: EdgeInsets.symmetric(horizontal: 0),child: IconButton(onPressed: (){},icon: Icon(Icons.add,size: 20,))),
                          // PopupMenuItem(padding: EdgeInsets.symmetric(horizontal: 0),child: IconButton(onPressed: (){},icon: Icon(Icons.add,size: 20,))),

                        ];
                      },

                    ),
                    const SizedBox(width: 10),
                   Container(
                     width: 245,
                     height: 50,
                     padding: const EdgeInsets.symmetric(
                       horizontal: 20.0 * 0.75,
                     ),
                     decoration: BoxDecoration(
                       color: Colors.transparent.withOpacity(0.05),
                       borderRadius: BorderRadius.circular(40),
                     ),
                     child:  const TextField(
maxLengthEnforcement: MaxLengthEnforcement.enforced,
maxLines: 15,
                       decoration:  InputDecoration(
                         isDense: true,
                         hintText: "Type message",
                         border: InputBorder.none,
                       ),
                     ),
                   ),
                   const SizedBox(width: 5),
                   CircleAvatar(
                     radius: 24,
                     backgroundColor: Colors_APP.color_primary,
                     child: IconButton(
                       onPressed: () {},
                       icon: const Icon(Icons.send_sharp,color: Colors.white),
                     ),
                   ),
                 ],
               ),
             ),

           ],
         ),



          ),
      ),


    );

  }
}
