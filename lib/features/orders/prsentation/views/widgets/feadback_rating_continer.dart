import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class FeadBackRatingContiner extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;
  final double? vertical, horizontal;
  const FeadBackRatingContiner(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isActive,
      this.vertical,
      this.horizontal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: vertical ?? 12.h, horizontal: horizontal ?? 15.w),
        // height: 52,
        // width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            color: isActive
                ? const Color(0xffFEEEE0)
                : AppColors.kOtpBorderColor.withOpacity(.2),
            border: Border.all(
                color: isActive
                    ? AppColors.kPrimColor
                    : AppColors.kOtpBorderColor),
            borderRadius: BorderRadius.circular(160)),
        child: Center(
          child: Text(title,
              style: AppStyle.textStyleBold18.copyWith(
                fontWeight: FontWeight.w300,
                color:
                    isActive ? AppColors.kPrimColor : const Color(0xff8B959E),
              )),
        ),
      ),
    );
  }
}
