// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:moared_app/core/config/resources/const/color.dart';
// import 'package:moared_app/core/config/widgets/Titles.dart';

// class myExpansionTile extends StatelessWidget {
//   String text1;
//   String text2;
//   String text3;
//   bool? variable;
//   Widget widget;
//   myExpansionTile({
//     Key? key,
//     required this.text1,
//     required this.text2,
//     required this.text3,
//     this.variable,
//     required this.widget,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       title: HeaderText(
//           text: text1,
//           textcolor: ColorManager().grey1,
//           fontSize: 16,
//           fontWeight: FontWeight.w600),
//       backgroundColor: Colors.grey[200],
//       collapsedShape: ContinuousRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20))),
//       shape: ContinuousRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20))),
//       collapsedBackgroundColor: Colors.grey[200],
//       textColor: ColorManager().red,
//       iconColor: ColorManager().red,
//       children: [
//         ListView.separated(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) => ExpansionTile(
//                   title: HeaderText(
//                       text: text2,
//                       fontSize: 16,
//                       textcolor: ColorManager().grey1,
//                       fontWeight: FontWeight.w600),
//                   backgroundColor: Colors.grey[200],
//                   collapsedShape: ContinuousRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                   shape: ContinuousRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                   collapsedBackgroundColor: Colors.grey[200],
//                   textColor: ColorManager().red,
//                   iconColor: ColorManager().red,
//                   children: [
//                     ListView.separated(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) => InkWell(
//                               onTap: () {},
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 33, vertical: 11),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       child: HeaderText(
//                                         text: text3,
//                                         fontSize: 16,
//                                         textcolor: ColorManager().grey1,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     widget
//                                   ],
//                                 ),
//                               ),
//                             ),
//                         separatorBuilder: (context, index) => Divider(
//                               indent: 22,
//                               endIndent: 22,
//                             ),
//                         itemCount: 2),
//                   ],
//                 ),
//             separatorBuilder: (context, index) => Divider(
//                   indent: 22,
//                   endIndent: 22,
//                 ),
//             itemCount: 2)
//       ],
//     );
//   }
// }
