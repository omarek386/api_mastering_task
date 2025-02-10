import '../../../../core/Router/routes.dart';
import '../../../../core/helper/Extensions/navigation.dart';
import '../../../../core/services/Database/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          CacheHelper.clearData();
          context.navigateToAndReplace(Routes.login);
        },
        icon: Icon(
          Icons.logout,
          color: Colors.cyan.shade400,
          size: 60.sp,
        ));
  }
}
