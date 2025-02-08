import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacing {
  static Widget verticalSpace(double space) {
    return SizedBox(height: space.h);
  }

  static Widget horizontalSpace(double space) {
    return SizedBox(width: space.w);
  }

  static Widget customSpacer({double? height, double? width}) {
    return SizedBox(
      height: height?.h,
      width: width?.w,
    );
  }

  static Widget verticalSpaceMedium() {
    return SizedBox(height: 20.h);
  }

  static Widget verticalSpaceSmall() {
    return SizedBox(height: 10.h);
  }

  static Widget verticalSpaceLarge() {
    return SizedBox(height: 30.h);
  }

  static Widget horizontalSpaceMedium() {
    return SizedBox(width: 20.w);
  }

  static Widget horizontalSpaceSmall() {
    return SizedBox(width: 10.w);
  }

  static Widget horizontalSpaceLarge() {
    return SizedBox(width: 30.w);
  }

  static Widget verticalSpaceTiny() {
    return SizedBox(height: 5.h);
  }

  static Widget horizontalSpaceTiny() {
    return SizedBox(width: 5.w);
  }

  static Widget verticalSpaceExtraLarge() {
    return SizedBox(height: 40.h);
  }

  static Widget horizontalSpaceExtraLarge() {
    return SizedBox(width: 40.w);
  }
}
