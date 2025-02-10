import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Router/routes.dart';
import '../../../../core/helper/Extensions/navigation.dart';

class UpdateData extends StatelessWidget {
  const UpdateData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        IconButton(
            onPressed: () {
              context.navigateTo(Routes.updateProfile);
            },
            icon: Icon(
              Icons.edit_note_outlined,
              color: Colors.blue,
              size: 40.sp,
            )),
        Text(
          'update your data now!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
