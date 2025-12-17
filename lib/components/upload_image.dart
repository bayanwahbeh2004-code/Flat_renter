import 'dart:io';
import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

class UploadImage extends StatefulWidget {
  final double width, height;
  final String? type;
  final File? image;
  final Function(File) onPick;

  UploadImage({
    required this.height,
    required this.width,
    required this.image,
    required this.onPick,
    this.type,
  });

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pic != null) {
          widget.onPick(File(pic.path));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.image == null
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
                  fit: BoxFit.cover,
                  height: widget.height,
                  width: widget.width,
                ),
              ),
      ),
    );
  }
}
