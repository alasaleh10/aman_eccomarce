import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double? radius;
  final bool isVisitor;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = AppColors.kPrimColor,
    this.isVisitor = false,
    this.borderColor = AppColors.kPrimColor2,
    this.textColor = AppColors.kWhiteColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.kPrimColor.withOpacity(.3),
          spreadRadius: 1,
          blurRadius: 30,
          offset: const Offset(0, 0),
        ),
      ]),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width * .8, 50.h),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 20.r),
                side: isVisitor == true
                    ? BorderSide(color: borderColor)
                    : BorderSide.none),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: isVisitor
                ? AppStyle.textStyleBold18.copyWith(
                    color: borderColor,
                  )
                : AppStyle.textStyleBold18.copyWith(color: textColor),
          )),
    );
  }
}
