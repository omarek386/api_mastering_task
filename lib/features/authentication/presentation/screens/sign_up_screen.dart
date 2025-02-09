import 'package:api_mastering_task/core/Router/routes.dart';
import 'package:api_mastering_task/core/helper/Extensions/navigation.dart';
import 'package:api_mastering_task/core/widget/image_edit.dart';
import 'package:api_mastering_task/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/helper/tools/spacer.dart';
import '../../../../core/widget/app_in_put_field.dart';
import '../widgets/auth_title_text.dart';
import '../widgets/sign_up_button.dart.dart';
import '../widgets/sign_up_here.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
          context.navigateTo(Routes.login);
        } else if (state is AuthSignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AuthSignUpPickImage) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Image Picked Successfully'),
              backgroundColor: Colors.green,
            ),
          );
        } else {}
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AuthSignUpLoading,
          child: Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color:
                    Colors.grey, // Light grey background similar to the image
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
                          controller: context.read<AuthCubit>().nameup,
                          gkey: context.read<AuthCubit>().nameUpKey,
                        ),
                        AppInPutField(
                          fieldName: 'Email Address',
                          controller: context.read<AuthCubit>().emailUp,
                          gkey: context.read<AuthCubit>().emailUpKey,
                        ),
                        AppInPutField(
                          fieldName: 'Phone Number',
                          controller: context.read<AuthCubit>().phoneUp,
                          keyboardType: TextInputType.phone,
                          gkey: context.read<AuthCubit>().phoneUpKey,
                        ),
                        AppInPutField(
                          fieldName: 'Password',
                          controller: context.read<AuthCubit>().passUp,
                          isPassword: true,
                          gkey: context.read<AuthCubit>().passUpKey,
                        ),
                        AppInPutField(
                          fieldName: 'Confirm Password',
                          controller: context.read<AuthCubit>().cPassUp,
                          isPassword: true,
                          gkey: context.read<AuthCubit>().cPassUpKey,
                        ),
                        AppTextButton(
                          title: 'if you have account go to',
                          buttonText: 'sign in Now',
                          navigateTo: Routes.login,
                        ),
                        Spacing.verticalSpaceLarge(),
                        SignUpButton(),
                        Spacing.verticalSpaceLarge(),
                      ],
                    ),
                    Positioned(
                      top: 70.h,
                      right: 20.w,
                      child: ImageEdit(
                        fileImage: context.read<AuthCubit>().profilePic,
                        onPressed: () async =>
                            await context.read<AuthCubit>().pickImage(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
