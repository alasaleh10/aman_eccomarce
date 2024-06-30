import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_stepper_listtile.dart';
import 'stepper_continer_cheeker.dart';

class FollowOrderStepper extends StatelessWidget {
  final String orderDate, orderReadyDate, delveryDate, reciveDate;
  final int status;
  const FollowOrderStepper(
      {super.key,
      required this.status,
      required this.orderDate,
      required this.orderReadyDate,
      required this.delveryDate,
      required this.reciveDate});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(height: 20.h),
                stepperContinerCheeker(index: 0, status: status),
                customVerticlDivider(index: 1, status: status),
                stepperContinerCheeker(index: 1, status: status),
                customVerticlDivider(index: 2, status: status),
                stepperContinerCheeker(index: 2, status: status),
                customVerticlDivider(index: 3, status: status),
                stepperContinerCheeker(index: 3, status: status)
              ],
            ),
            // const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OrderStepperListTile(
                    title: 'orderTime'.tr(),
                    subTitle: orderDate,
                  ),
                  OrderStepperListTile(
                      title: 'orderHasBeenProcessed'.tr(),
                      subTitle: orderReadyDate),
                  OrderStepperListTile(
                      title: 'deliveryStage'.tr(), subTitle: delveryDate),
                  OrderStepperListTile(
                      title: 'orderHasBeenDelivery'.tr(), subTitle: reciveDate),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//
