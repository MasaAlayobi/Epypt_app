import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.icon, required this.iconColor, required this.title, required this.subtitle});
 final IconData icon;
 final Color iconColor;
 final String title;
 final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        minTileHeight: 70,
        leading: Icon(
          icon,
          size: 27,
          color:iconColor,
        ),
        title: CustomText(
            text: title,
            size: 12,
            color: colorApp.greyColor,
            fontWeight: FontWeight.bold,
            maxLines: 1),
        subtitle: CustomText(
            text:subtitle,
            size: 14,
            color: colorApp.blackColor,
            fontWeight: FontWeight.w700,
            maxLines: 1),
      ),
    );
    ;
  }
}
