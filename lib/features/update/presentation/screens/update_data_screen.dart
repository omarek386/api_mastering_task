import 'package:api_mastering_task/core/widget/app_in_put_field.dart';
import 'package:api_mastering_task/core/widget/image_edit.dart';
import 'package:api_mastering_task/features/update/presentation/widgets/update_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/tools/spacer.dart';

class UpdateDataScreen extends StatelessWidget {
  const UpdateDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF091245), // Background color similar to image

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Update your data Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacing.verticalSpaceSmall(),
              ImageEdit(),
              Spacing.verticalSpaceLarge(),
              AppInPutField(
                emailController: TextEditingController(),
                hint: 'User Name',
                gkey: GlobalKey<FormState>(),
              ),
              AppInPutField(
                emailController: TextEditingController(),
                hint: 'Email Address',
                gkey: GlobalKey<FormState>(),
              ),
              AppInPutField(
                emailController: TextEditingController(),
                hint: 'Phone Number',
                gkey: GlobalKey<FormState>(),
              ),
              AppInPutField(
                emailController: TextEditingController(),
                hint: 'Password',
                isPassword: true,
                gkey: GlobalKey<FormState>(),
              ),
              AppInPutField(
                emailController: TextEditingController(),
                hint: 'Confirm Password',
                isPassword: true,
                gkey: GlobalKey<FormState>(),
              ),
              Spacing.verticalSpaceMedium(),
              UpdateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
