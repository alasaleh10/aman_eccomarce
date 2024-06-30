import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class FollowOrderContiner extends StatelessWidget {
  final String orderNumber;
  final VoidCallback onTap;
  const FollowOrderContiner(
      {super.key, required this.orderNumber, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7), topRight: Radius.circular(7)),
          color: AppColors.kPrimColor),
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesOrdernumber),
          const SizedBox(width: 10),
          Text(
            'orderNumber'.tr(),
            style: AppStyle.textStyleRegular14.copyWith(
              color: AppColors.kWhiteColor,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '#$orderNumber',
            style: AppStyle.textStyleRegular14.copyWith(
                color: AppColors.kWhiteColor, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'followOrder'.tr(),
                style: AppStyle.textStyleRegular16.copyWith(
                  color: AppColors.kPrimColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
