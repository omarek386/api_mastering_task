import 'package:api_mastering_task/core/helper/tools/spacer.dart';
import 'package:api_mastering_task/features/home/presentation/widgets/data_text_box.dart';
import 'package:api_mastering_task/features/home/presentation/widgets/image_show.dart';
import 'package:api_mastering_task/features/home/presentation/widgets/logout_button.dart';
import 'package:api_mastering_task/features/home/presentation/widgets/title_text_box.dart';
import 'package:api_mastering_task/features/home/presentation/widgets/update_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacing.verticalSpaceExtraLarge(),
            ImageShow(),
            Spacing.verticalSpaceLarge(),
            TitleTextBox(name: name),
            Spacing.verticalSpaceLarge(),
            DataTextBox(phone: phone, email: email, coordinates: coordinates),
            Spacing.verticalSpaceMedium(),
            UpdateData(),
            Spacing.verticalSpaceExtraLarge(),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
