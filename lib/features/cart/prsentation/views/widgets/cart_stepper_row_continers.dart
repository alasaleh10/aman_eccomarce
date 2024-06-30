import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import 'cart_stepper_continer.dart';

class CartStepperRowContiners extends StatelessWidget {
  const CartStepperRowContiners({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          CartSteperContiner(
            image: Assets.imagesCart,
            title: 'products'.tr(),
            isActive: true,
          ),
          const SizedBox(width: 10),
          const Expanded(child: Divider()),
          const SizedBox(width: 10),
          CartSteperContiner(
            image: Assets.imagesLocation2,
            title: 'delivery'.tr(),
            isActive: false,
          ),
          const SizedBox(width: 10),
          const Expanded(child: Divider()),
          const SizedBox(width: 10),
          CartSteperContiner(
            image: Assets.imagesPayment,
            title: 'payment'.tr(),
            isActive: false,
          ),
        ],
      ),
    );
  }
}
