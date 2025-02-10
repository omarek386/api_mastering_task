import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/tools/spacer.dart';
import '../cubit/home_cubit.dart';
import '../widgets/data_text_box.dart';
import '../widgets/image_show.dart';
import '../widgets/logout_button.dart';
import '../widgets/title_text_box.dart';
import '../widgets/update_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final String name = 'MOHAMED';
  final String phone = '01125635996';
  final String email = 'omarek386@gmail.com';
  final String coordinates = '[23.6,-22.336]';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF091245), // Background color similar to image

      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacing.verticalSpaceExtraLarge(),
                  SizedBox(
                    width: 150.w,
                    height: 150.h,
                    child: ImageShow(
                      profilePic: state.userModel.profilePic,
                    ),
                  ),
                  Spacing.verticalSpaceMedium(),
                  TitleTextBox(name: state.userModel.name),
                  Spacing.verticalSpaceLarge(),
                  DataTextBox(
                      phone: state.userModel.phoneNumber,
                      email: state.userModel.email,
                      coordinates:
                          '[ ${state.userModel.latitude.toString().substring(0, 6)} , ${state.userModel.longitude.toString().substring(0, 6)} ]'),
                  Spacing.verticalSpaceMedium(),
                  UpdateData(),
                  Spacing.verticalSpaceExtraLarge(),
                  LogoutButton(),
                ],
              ),
            );
          } else if (state is HomeError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
            );
          } else if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeInitial) {
            BlocProvider.of<HomeCubit>(context).getUser();
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
