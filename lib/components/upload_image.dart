import 'dart:io';
import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  double width, height;
  String? type;
  UploadImage({required this.height, required this.width, this.type});

  File? image;
  

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: image == null
            ? Image.asset(
                KuploadImage,
                height: widget.height,
                width: widget.width,
              )
            : widget.type == "profile"
            ? Image.asset(KProfile, height: widget.height, width: widget.width)
            : widget.type == "id"
            ? Image.asset(
                KPictureId,
                height: widget.height,
                width: widget.width,
              )
            : ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: Image.file(
                  widget.image!,
                  fit: BoxFit.fill,
                  height: widget.height,
                  width: widget.width,
                ),
              ),
      ),
    );
  }
}
