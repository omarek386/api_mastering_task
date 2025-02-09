import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppInPutField extends StatefulWidget {
  final String? fieldName;
  final String? hint;
  final TextEditingController emailController;
  final bool isPassword;
  final TextInputType? keyboardType;
  final GlobalKey<FormState> gkey;

  const AppInPutField(
      {super.key,
      required this.gkey,
      this.fieldName,
      this.hint,
      required this.emailController,
      this.isPassword = false,
      this.keyboardType});

  @override
  State<AppInPutField> createState() => _AppInPutFieldState();
}

class _AppInPutFieldState extends State<AppInPutField> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.fieldName != null)
              Text(widget.fieldName!,
                  style: TextStyle(
                    color: Colors.brown[900],
                    fontSize: 20.sp,
                  )),
            Form(
              key: widget.gkey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  } else if (widget.fieldName == 'Email Address' &&
                      !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                keyboardType: widget.keyboardType,
                autocorrect: false,
                enableSuggestions: false,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
                controller: widget.emailController,
                //* to hide the password
                obscureText: widget.isPassword ? isSecure : false,
                //* decoration for the input field
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                  ),
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: Icon(
                            isSecure ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isSecure = !isSecure;
                            });
                          },
                        )
                      : null,
                ),
              ),
            ),
          ],
        ));
  }
}
