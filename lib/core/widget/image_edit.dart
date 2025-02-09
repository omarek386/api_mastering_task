import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImageEdit extends StatelessWidget {
  const ImageEdit({super.key, required this.onPressed, this.fileImage});
  final void Function()? onPressed;
  final XFile? fileImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: Colors.white,
          backgroundImage:
              fileImage != null ? FileImage(File(fileImage!.path)) : null,
          child: fileImage == null
              ? Icon(
                  Icons.person_outline,
                  size: 60.r,
                  color: Colors.black38,
                )
              : null,
        ),
        Positioned(
            bottom: -5.h,
            right: -15.w,
            child: IconButton(
                onPressed: onPressed, icon: Icon(Icons.add_a_photo))),
      ],
    );
  }
}
