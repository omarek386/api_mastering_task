import 'dart:developer';

import 'package:api_mastering_task/core/Router/routes.dart';
import 'package:api_mastering_task/core/helper/Extensions/navigation.dart';
import 'package:api_mastering_task/core/widget/app_in_put_field.dart';
import 'package:api_mastering_task/core/widget/image_edit.dart';
import 'package:api_mastering_task/features/update/presentation/cubit/update_profile_cubit.dart';
import 'package:api_mastering_task/features/update/presentation/widgets/update_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/tools/spacer.dart';

class UpdateDataScreen extends StatelessWidget {
  const UpdateDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF091245), // Background color similar to image

      body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        builder: (context, state) {
          if (state is UpdateProfileLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // else if (state is UpdateProfileError) {
          //   return Center(
          //     child:
          //         Text(state.errorMessage, style: TextStyle(color: Colors.red)),
          //   );
          // }
          else if (state is UpdateProfileSuccess) {
            return Center(
              child: Text('Success'),
            );
          } else {
            return SingleChildScrollView(
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
                    ImageEdit(
                      onPressed: () async => await context
                          .read<UpdateProfileCubit>()
                          .updateProfilePic(),
                      networkImage:
                          context.read<UpdateProfileCubit>().profilePic,
                      fileImage: context.read<UpdateProfileCubit>().imageFile,
                    ),
                    Spacing.verticalSpaceLarge(),
                    AppInPutField(
                      controller:
                          context.read<UpdateProfileCubit>().nameController,
                      hint: 'User Name',
                      gkey: context.read<UpdateProfileCubit>().nameKye,
                    ),
                    AppInPutField(
                      controller:
                          context.read<UpdateProfileCubit>().phoneController,
                      hint: 'Phone Number',
                      gkey: context.read<UpdateProfileCubit>().phoneKye,
                    ),
                    Spacing.verticalSpaceMedium(),
                    UpdateButton(),
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is UpdateProfileInitial) {
            log('Initial State');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Initial State'),
              ),
            );
          }
          if (state is UpdateProfileSuccess) {
            context.navigateToAndReplace(Routes.home);
          } else if (state is UpdateProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          } else if (state is UpdateProfilePicSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Image Updated Successfully'),
              ),
            );
          } else if (state is UpdateProfileLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Loading...'),
              ),
            );
          }
        },
      ),
    );
  }
}
