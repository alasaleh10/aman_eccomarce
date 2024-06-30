import 'package:aman_store2/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_styles.dart';
import 'custom_elevated_button.dart';

class FailureColumn extends StatelessWidget {
  final String errorMessage;
  final String? title;
  final VoidCallback onPressed;

  const FailureColumn(
      {super.key,
      required this.errorMessage,
      required this.onPressed,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMessage,
          style: AppStyle.textStyleBold22
              .copyWith(fontSize: 19.sp, color: AppColors.kPrimColor),
        ),
        SizedBox(height: 15.h),
        CustomElevatedButton(
            title: title ?? 'tryAgain'.tr(), onPressed: onPressed)
      ],
    );
  }
}
