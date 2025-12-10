import 'dart:io';

import 'package:flutter/material.dart';

class Apartmentpicture extends StatelessWidget {
  double width,height;
  /*File mainImage;*/
  Apartmentpicture({super.key,required this.height,required this.width/*,required this.mainImage*/});

  @override
  Widget build(BuildContext context) {
    return Image./*file(mainImage)*/asset("assets/images/upload image.png");
  }
}