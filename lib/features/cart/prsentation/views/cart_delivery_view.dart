import 'package:aman_store2/core/utils/app_colors.dart';
import 'package:aman_store2/features/cart/prsentation/views/widgets/cart_next_button.dart';
import 'package:aman_store2/features/cart/prsentation/views/widgets/d_cart_address_continer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import 'widgets/d_cart_add_new_location.dart';
import 'widgets/d_cart_delevry_continer.dart';

class CartDeliveryView extends StatelessWidget {
  const CartDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Text(
            'delivryAddress'.tr(),
            style: AppStyle.textStyleBold18.copyWith(
                color: AppColors.kBlackColor, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 9),
        const DCartAddressContiner(),
        const SizedBox(height: 15),
        const DCartAddLocation(),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Text('deliveryTime'.tr(),
              style: AppStyle.textStyleBold18.copyWith(
                  color: AppColors.kBlackColor, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 9),
        const DCartDeliveryContiner(),
        SizedBox(height: 25.h),
        CartNextButton(onPressed: () {}, price: '3600')
      ],
    );
  }
}
