import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/Router/routes.dart';
import '../../../../core/helper/Extensions/navigation.dart';
import '../../../../core/helper/tools/spacer.dart';
import '../../../../core/widget/app_in_put_field.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/auth_title_text.dart';
import '../widgets/sign_in_button.dart';
import '../widgets/sign_up_here.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.message),
            ),
          );
          context.navigateToAndReplace(Routes.home);
        } else if (state is AuthSignInError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AuthSignInLoading,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacing.verticalSpace(70),
                    AuthTitleText(title: 'SignIn Now !'),
                    Spacing.verticalSpaceLarge(),
                    AppInPutField(
                      fieldName: 'Email Address',
                      controller: context.read<AuthCubit>().email,
                      gkey: context.read<AuthCubit>().emailKey,
                    ),
                    Spacing.verticalSpaceSmall(),
                    AppInPutField(
                      fieldName: 'Password',
                      controller: context.read<AuthCubit>().pass,
                      gkey: context.read<AuthCubit>().passKey,
                      isPassword: true,
                    ),
                    Spacing.verticalSpaceLarge(),
                    AppTextButton(
                      title: "if you don't have account go to",
                      buttonText: 'Sign up Now',
                      navigateTo: Routes.register,
                    ),
                    Spacing.verticalSpaceLarge(),
                    SignInButton(),
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
