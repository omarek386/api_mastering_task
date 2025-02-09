import 'package:api_mastering_task/core/Router/routes.dart';
import 'package:api_mastering_task/core/widget/image_edit.dart';
import 'package:api_mastering_task/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/tools/spacer.dart';
import '../../../../core/widget/app_in_put_field.dart';
import '../widgets/auth_title_text.dart';
import '../widgets/sign_up_here.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
                        fieldName: 'User Name',
                        emailController: TextEditingController(),
                        gkey: GlobalKey<FormState>(),
                      ),
                      AppInPutField(
                        fieldName: 'Email Address',
                        emailController: TextEditingController(),
                        gkey: GlobalKey<FormState>(),
                      ),
                      AppInPutField(
                        fieldName: 'Phone Number',
                        emailController: TextEditingController(),
                        keyboardType: TextInputType.phone,
                        gkey: GlobalKey<FormState>(),
                      ),
                      AppInPutField(
                        fieldName: 'Password',
                        emailController: TextEditingController(),
                        isPassword: true,
                        gkey: GlobalKey<FormState>(),
                      ),
                      AppInPutField(
                        fieldName: 'Confirm Password',
                        emailController: TextEditingController(),
                        isPassword: true,
                        gkey: GlobalKey<FormState>(),
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
      },
    );
  }
}
