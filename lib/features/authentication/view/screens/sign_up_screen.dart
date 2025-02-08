import 'package:api_mastering_task/core/Router/routes.dart';
import 'package:api_mastering_task/core/widget/image_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/tools/spacer.dart';
import '../../../../core/widget/app_in_put_field.dart';
import '../widgets/auth_title_text.dart';
import '../widgets/sign_up_here.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.grey, // Light grey background similar to the image
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacing.verticalSpace(70),
                  AuthTitleText(title: 'Sign Up Now!'),
                  Spacing.verticalSpaceLarge(),
                  AppInPutField(
                    filedName: 'User Name',
                    emailController: TextEditingController(),
                  ),
                  AppInPutField(
                    filedName: 'Email Address',
                    emailController: TextEditingController(),
                  ),
                  AppInPutField(
                    filedName: 'Phone Number',
                    emailController: TextEditingController(),
                    keyBoardType: TextInputType.phone,
                  ),
                  AppInPutField(
                    filedName: 'Password',
                    emailController: TextEditingController(),
                    isPassword: true,
                  ),
                  AppInPutField(
                    filedName: 'Confirm Password',
                    emailController: TextEditingController(),
                    isPassword: true,
                  ),
                  AppTextButton(
                    title: 'if you have account go to',
                    buttonText: 'sign in Now',
                    navigateTo: Routes.login,
                  ),
                ],
              ),
              Positioned(
                top: 75.h,
                right: 20.w,
                child: ImageEdit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
