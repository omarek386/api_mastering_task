import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4FC3F7), // Slightly darker blue
        foregroundColor: Colors.black, // Text color
        textStyle: TextStyle(
          fontSize: 22.sp, // Slightly larger text
          fontWeight: FontWeight.w900, // Even bolder
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 30.w, vertical: 15.h), // Adjusted padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 10, // Increased elevation
        shadowColor: Colors.black54, // Darker shadow color
      ),
      child: const Text('Update'),
    );
  }
}
