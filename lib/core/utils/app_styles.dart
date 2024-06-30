import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constins/const.dart';

import 'app_colors.dart';

abstract class AppStyle {
  static TextStyle textStyleBold18 = TextStyle(
    fontSize: 18.sp,
    fontFamily: cairoFont,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static TextStyle textStyleBold25 = TextStyle(
    fontSize: 25.sp,
    fontFamily: cairoFont,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static TextStyle textStyleBold22 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    fontFamily: cairoFont,
    color: AppColors.kBlackColor,
  );

  static TextStyle textStyleRegular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kBlackColor,
    fontFamily: cairoFont,
  );

  static TextStyle textStyleRegular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: cairoFont,
    color: AppColors.kBlackColor,
  );
  static TextStyle textStyleBold30 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle textStyleBold12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    fontFamily: cairoFont,
    color: Colors.black,
  );
  static TextStyle textStyleBold17 = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    fontFamily: cairoFont,
    color: Colors.black,
  );
  static TextStyle textStyleSemiBold20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: cairoFont,
    color: Colors.black,
  );
  static TextStyle textStyleSemiBold15 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    fontFamily: cairoFont,
    color: Colors.black,
  );
  static TextStyle textStyleSemiBold23 = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeight.bold,
    fontFamily: cairoFont,
    color: Colors.black,
  );
}
