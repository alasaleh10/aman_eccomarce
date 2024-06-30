import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ItemsTitleAndPrice extends StatelessWidget {
  final String title, subTitle, price;
  const ItemsTitleAndPrice(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.textStyleRegular14,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5.h),
        Text(
          subTitle,
          style: AppStyle.textStyleBold12.copyWith(fontWeight: FontWeight.w400),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        DefaultTextStyle(
          style: AppStyle.textStyleRegular14.copyWith(
              color: AppColors.kPrimColor, fontWeight: FontWeight.bold),
          child: Row(
            children: [
              Text(price),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'ry'.tr(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
