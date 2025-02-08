import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppInPutField extends StatefulWidget {
  final String? filedName;
  final String? hint;
  final TextEditingController emailController;
  final bool isPassword;
  final TextInputType? keyBoardType;
  bool isSecure = true;

  AppInPutField(
      {super.key,
      this.filedName,
      this.hint,
      required this.emailController,
      this.isPassword = false,
      this.keyBoardType});

  @override
  State<AppInPutField> createState() => _AppInPutFieldState();
}

class _AppInPutFieldState extends State<AppInPutField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.filedName != null)
              Text(widget.filedName!,
                  style: TextStyle(
                    color: Colors.brown[900],
                    fontSize: 20.sp,
                  )),
            TextField(
              keyboardType: widget.keyBoardType,
              autocorrect: false,
              enableSuggestions: false,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
              controller: widget.emailController,
              obscureText: widget.isPassword ? widget.isSecure : false,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          widget.isSecure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          widget.isSecure = !widget.isSecure;
                          log('isSecure: ${widget.isSecure}');
                          setState(() {});
                        },
                      )
                    : null,
              ),
            ),
          ],
        ));
  }
}
