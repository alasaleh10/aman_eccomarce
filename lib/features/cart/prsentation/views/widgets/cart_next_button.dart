import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class CartNextButton extends StatelessWidget {
  final String price;
  final VoidCallback onPressed;
  const CartNextButton({
    super.key,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'total'.tr(),
                style: AppStyle.textStyleRegular16,
              ),
              Text('$price ${'ry2'.tr()}',
                  style: AppStyle.textStyleBold18.copyWith(
                      color: AppColors.kPrimColor, fontWeight: FontWeight.w600))
            ],
          ),
        ),
        SizedBox(height: 20.h),
        CustomElevatedButton(title: 'next'.tr(), onPressed: onPressed),
        SizedBox(height: 20.h),
      ],
    );
  }
}
