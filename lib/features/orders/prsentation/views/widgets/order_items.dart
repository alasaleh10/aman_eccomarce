import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/functions/order_status.dart';
import '../../../../../core/routers/app_routers.dart';
import '../../../../../core/utils/app_colors.dart';
import 'follow_order_continer.dart';
import 'table_detils_texts.dart';

class OrderItems extends StatelessWidget {
  final int status;
  const OrderItems({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          FollowOrderContiner(
            onTap: () {
              GoRouter.of(context).pushNamed(AppRouters.followOrderView);
            },
            orderNumber: '511',
          ),
          Table(
            border: TableBorder.all(color: AppColors.kOtpBorderColor),
            children: [
              TableRow(children: [
                TableDetilsTexts(
                  title: 'orderTime'.tr(),
                  subTitle: '2023/7/9 2:50 PM',
                ),
                TableDetilsTexts(
                  title: 'deliveryTime'.tr(),
                  subTitle: '2023/7/9 اليوم',
                ),
              ]),
              TableRow(children: [
                TableDetilsTexts(
                    title: 'orderTotal'.tr(), subTitle: '350  ${'ry'.tr()}'),
                TableDetilsTexts(
                  doneDelivery: true,
                  title: 'orderStatus'.tr(),
                  subTitle: orderStatus(status),
                ),
              ]),
            ],
          )
        ],
      ),
    );
  }
}
