import 'package:api_mastering_task/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (context.read<AuthCubit>().nameUpKey.currentState!.validate() &&
            context.read<AuthCubit>().emailUpKey.currentState!.validate() &&
            context.read<AuthCubit>().phoneUpKey.currentState!.validate() &&
            context.read<AuthCubit>().passUpKey.currentState!.validate() &&
            context.read<AuthCubit>().cPassUpKey.currentState!.validate() &&
            context.read<AuthCubit>().passUp.text ==
                context.read<AuthCubit>().cPassUp.text &&
            context.read<AuthCubit>().profilePic != null) {
          context.read<AuthCubit>().signUp();
        } else if (context.read<AuthCubit>().passUp.text !=
            context.read<AuthCubit>().cPassUp.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Passwords do not match'),
            ),
          );
        } else if (context.read<AuthCubit>().profilePic == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Please pick a profile picture'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Please fill all fields'),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
        backgroundColor: const Color(0xFF555555),
      ),
      child: Text(
        'Sign up',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
