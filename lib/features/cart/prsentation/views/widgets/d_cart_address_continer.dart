import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class DCartAddressContiner extends StatelessWidget {
  const DCartAddressContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
          padding: EdgeInsets.only(bottom: 20.h, top: 15.h),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.kOtpBorderColor),
              borderRadius: BorderRadius.circular(5.r)),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: Radio(
                activeColor: AppColors.kPrimColor,
                fillColor: MaterialStateProperty.all(AppColors.kPrimColor),
                value: 4,
                groupValue: 4,
                onChanged: (t) {}),
            title: Text('deliveryToCurrentAddrss'.tr(),
                style: AppStyle.textStyleRegular16
                    .copyWith(color: AppColors.kBlackColor)),
            subtitle: Text(
              'حضرموت – سيئون – شارع الجزائر – عمارة الكاف – شقة رقم 6',
              style: AppStyle.textStyleBold12
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.kOtpBorderColor)),
              child: const Icon(
                Icons.near_me_outlined,
                color: AppColors.kPrimColor,
                size: 25,
              ),
            ),
          )),
    );
  }
}
