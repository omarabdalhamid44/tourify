// import 'package:flutter/material.dart';
// import 'package:xdd/utils/VeriableConst/colors.dart';
// import 'package:xdd/utils/VeriableConst/listOf_Thing.dart';
// import 'package:xdd/utils/Widgets/textField_.dart';
// import 'package:xdd/utils/sizeconfig.dart';
//
// class RowItem extends  StatefulWidget {
//   String selected;
//   List<String> list_Of_Thing;
//
//   RowItem({required this.selected, required this.list_Of_Thing});
//
//   @override
//   State<RowItem> createState() => _RowItemState();
// }
//
// class _RowItemState extends State<RowItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//             child: Container(
//           padding: EdgeInsets.only(left: SizeConfig.scaleWidth(9)),
//           decoration: BoxDecoration(
//               color: Color(0xffF8F8F8), borderRadius: BorderRadius.circular(5)),
//           child: DropdownButton<String>(
//             isExpanded: true,
//             alignment: Alignment.topLeft,
//             borderRadius: BorderRadius.circular(5),
//             underline: Text(''),
//             icon: Icon(Icons.keyboard_arrow_down_rounded),
//             style: TextStyle(
//                 color: Colors.black87,
//                 fontSize: SizeConfig.scaleTextFont(13),
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w500),
//             elevation: 0,
//             items: ListOfThings.list_of_countries.map((String dropDownStringItem1) {
//               return DropdownMenuItem<String>(
//                 alignment: AlignmentDirectional.centerStart,
//                 value: dropDownStringItem1,
//                 child: Text(dropDownStringItem1),
//               );
//             }).toList(),
//             onChanged: (newValueSelected) {
//               setState(() {
//                 selected = newValueSelected!;
//               });
//             },
//             value: selected,
//           ),
//         )),
//         SizedBox(width: SizeConfig.scaleWidth(10)),
//         Expanded(
//             child: textField_app(
//           hint: 'City ...',
//           fillColors: Color(0xffF8F8F8),
//         )),
//       ],
//     );
//   }
// }
