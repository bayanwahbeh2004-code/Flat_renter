import 'dart:io';
import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  double width, height;
  String? type;
  UploadImage({required this.height, required this.width, this.type});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pic != null) {
          setState(() {
            image = File(pic.path);
          });
        }
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        child: image == null
            ? Image.asset(
                KuploadImage,
                height: widget.height,
                width: widget.width,
              )
            : widget.type == "profile"
            ? Image.asset(KProfile, height: widget.height, width: 250)
            : widget.type == "id"
            ? Image.asset(
                KPictureId,
                height: widget.height,
                width: widget.width,
              )
            : Image.file(image!),
      ),
    );
  }
}
