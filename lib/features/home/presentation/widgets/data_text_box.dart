import '../../../../core/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataTextBox extends StatelessWidget {
  const DataTextBox({
    super.key,
    required this.phone,
    required this.email,
    required this.coordinates,
  });

  final String phone;
  final String email;
  final String coordinates;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          height: 1.2.h,
          color: Colors.grey.shade400,
          fontSize: 20.sp,
          fontFamily: Fonts.description,
        ),
        children: <TextSpan>[
          TextSpan(text: 'You have a phone number is\n'),
          TextSpan(text: phone, style: TextStyle(color: Colors.orange)),
          TextSpan(text: ' and your email is\n'),
          TextSpan(text: email, style: TextStyle(color: Colors.orange)),
          TextSpan(text: ' and your coordinates is '),
          TextSpan(text: coordinates, style: TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }
}
