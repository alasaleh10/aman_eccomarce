import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'order_stepper_listtile.dart';

class FollowOrderScoundTable extends StatelessWidget {
  final String deliveryPrice, discount, total, paymentMethod;
  const FollowOrderScoundTable(
      {super.key,
      required this.deliveryPrice,
      required this.discount,
      required this.total,
      required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Table(
        border: TableBorder.all(color: AppColors.kOtpBorderColor),
        children: [
          TableRow(
            children: [
              OrderStepperListTile(
                title: 'deliveryPrice'.tr(),
                subTitle: deliveryPrice,
              ),
              OrderStepperListTile(
                title: 'discountCoupone'.tr(),
                subTitle: discount,
              )
            ],
          ),
          TableRow(children: [
            OrderStepperListTile(
              title: 'orderTotal'.tr(),
              subTitle: total,
            ),
            OrderStepperListTile(
              color: AppColors.kPrimColor,
              title: 'paymentMethod'.tr(),
              subTitle: paymentMethod,
            )
          ])
        ],
      ),
    );
  }
}
