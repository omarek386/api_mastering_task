import '../../../../core/helper/Extensions/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.title,
    required this.buttonText,
    required this.navigateTo,
  });
  final String title;
  final String buttonText;
  final String navigateTo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight:
                FontWeight.w300, // Lighter shade of black for less emphasis
            fontSize: 16.sp,
          ),
        ),
        TextButton(
            onPressed: () {
              context.navigateTo(navigateTo);
            },
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            )),
      ],
    );
  }
}
