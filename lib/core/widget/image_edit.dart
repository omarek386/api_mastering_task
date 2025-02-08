import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageEdit extends StatelessWidget {
  const ImageEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.person_outline, // Placeholder profile icon
            size: 60.r,
            color: Colors.black38,
          ),
        ),
        Positioned(
            bottom: -5.h,
            right: -15.w,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo))),
      ],
    );
  }
}
