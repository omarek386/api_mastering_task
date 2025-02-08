import 'package:api_mastering_task/core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleTextBox extends StatelessWidget {
  const TitleTextBox({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
          text: TextSpan(
        style: TextStyle(
            color: Colors.white,
            fontSize: 40.sp,
            height: 1.2.h,
            fontFamily: Fonts.title),
        children: <TextSpan>[
          TextSpan(text: 'Hi, '),
          TextSpan(
            text: name,
            style: TextStyle(color: Colors.orange),
          ),
          TextSpan(text: '\nWELCOME IN MY APP'),
        ],
      )),
    );
  }
}
