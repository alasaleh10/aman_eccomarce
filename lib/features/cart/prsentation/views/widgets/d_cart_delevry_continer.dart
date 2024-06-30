import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class DCartDeliveryContiner extends StatelessWidget {
  const DCartDeliveryContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kPrimColor),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: const BoxDecoration(color: AppColors.kPrimColor),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.imagesFastDelevryCar),
                    const SizedBox(width: 11.8),
                    Text('fastDelivry'.tr(),
                        style: AppStyle.textStyleRegular16
                            .copyWith(color: AppColors.kWhiteColor)),
                    const Spacer(),
                    Switch.adaptive(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        trackOutlineWidth: const MaterialStatePropertyAll(20),
                        activeColor: AppColors.kPrimColor,
                        inactiveThumbColor: AppColors.kWhiteColor,
                        inactiveTrackColor: AppColors.kWhiteColor,
                        activeTrackColor: AppColors.kWhiteColor,
                        value: true,
                        onChanged: (val) {
                          // controller.changeDeliveryTime(val);
                        })
                  ],
                )),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('deliveryWithin'.tr(), style: AppStyle.textStyleBold12),
                Text('+ 20 ${'ry'.tr()}',
                    style: AppStyle.textStyleBold12.copyWith(
                        color: AppColors.kPrimColor,
                        fontWeight: FontWeight.w600))
              ],
            )
          ],
        ),
      ),
    );
  }
}
