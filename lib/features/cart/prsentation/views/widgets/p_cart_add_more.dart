import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class PCartAddMore extends StatelessWidget {
  const PCartAddMore({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(Assets.imagesFreeDelivery),
      title: Text(
        'addMoreProducts'.tr(),
        style: AppStyle.textStyleRegular16
            .copyWith(fontWeight: FontWeight.bold, color: AppColors.kPrimColor),
      ),
      subtitle: Text(
        'اطلب ب 300 ريال او اكثر واحصل على شحن مجانى',
        style: AppStyle.textStyleBold12.copyWith(fontWeight: FontWeight.w400),
      ),
      trailing: DottedBorder(
        color: AppColors.kPrimColor,
        dashPattern: const [9, 10],
        borderPadding: const EdgeInsets.symmetric(vertical: 2),
        strokeWidth: 3,
        borderType: BorderType.Circle,
        child: SizedBox(
          height: 44.h,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              // width: 44,
              decoration: const BoxDecoration(
                color: Color(0xffFEF1E5),
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(Icons.add, color: AppColors.kPrimColor, size: 25),
            ),
          ),
        ),
      ),
    );
  }
}
