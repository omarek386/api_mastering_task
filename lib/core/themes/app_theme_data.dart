import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appthemedata {
  static ThemeData themeData = ThemeData(
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      fillColor: Color(0xFF555555),
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(30.r),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: Colors.blue,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );
}
