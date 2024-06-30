import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

Widget stepperContinerCheeker({required int index, required int status}) {
  if (status > index) {
    return Container(
      height: 25.h,
      width: 25.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.kPrimColor.withOpacity(.3),
          spreadRadius: 1,
          blurRadius: 20,
          offset: const Offset(0, 0),
        ),
      ], shape: BoxShape.circle, color: AppColors.kPrimColor),
      child: Icon(
        Icons.check,
        color: AppColors.kWhiteColor,
        size: 18.r,
      ),
    );
  } else if (status == index) {
    return Container(
      height: 25.h,
      width: 25.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.kPrimColor.withOpacity(.3),
          spreadRadius: 1,
          blurRadius: 20,
          offset: const Offset(0, 0),
        ),
      ], color: AppColors.kPrimColor.withOpacity(.2), shape: BoxShape.circle),
      child: Center(
        child: Container(
          height: 15.h,
          width: 15.h,
          // padding: EdgeInsets.all(5),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.kPrimColor),
        ),
      ),
    );
  } else {
    return Container(
      height: 25.h,
      width: 25.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimColor, width: 2.5),
          shape: BoxShape.circle),
    );
  }
}

Widget customVerticlDivider({required status, required index}) {
  return SizedBox(
    height: 50.h,
    child: VerticalDivider(
      color: status == index || status > index
          ? AppColors.kPrimColor
          : AppColors.kPrimColor.withOpacity(.5),
      thickness: 2.8,
    ),
  );
}
