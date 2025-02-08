import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTitleText extends StatelessWidget {
  const AuthTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Or a darker shade
        ),
      ),
    );
  }
}
