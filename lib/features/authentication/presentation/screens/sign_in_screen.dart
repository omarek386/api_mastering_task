import 'package:api_mastering_task/core/Router/routes.dart';
import 'package:api_mastering_task/core/helper/tools/spacer.dart';
import 'package:api_mastering_task/core/widget/app_in_put_field.dart';

import 'package:api_mastering_task/features/authentication/presentation/widgets/auth_title_text.dart';
import 'package:api_mastering_task/features/authentication/presentation/widgets/sign_up_here.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacing.verticalSpace(70),
              AuthTitleText(title: 'SignIn Now !'),
              Spacing.verticalSpaceLarge(),
              AppInPutField(
                  filedName: 'Email Address',
                  emailController: TextEditingController()),
              Spacing.verticalSpaceSmall(),
              AppInPutField(
                filedName: 'Password',
                emailController: TextEditingController(),
                isPassword: true,
              ),
              Spacing.verticalSpaceLarge(),
              AppTextButton(
                title: "if you don't have account go to",
                buttonText: 'Sign up Now',
                navigateTo: Routes.register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
