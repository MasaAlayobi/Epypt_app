import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  String image;
  ImageProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.height / 7,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Image.asset(
              "asstes/images/no_photo.jpg",
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height / 7,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}