import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/functions/order_status.dart';
import '../../../../../core/utils/app_colors.dart';
import 'table_detils_texts.dart';

class FollowOrderTopTable extends StatelessWidget {
  final String orderDate, deliveryDate, total;
  final int status;
  const FollowOrderTopTable(
      {super.key,
      required this.orderDate,
      required this.deliveryDate,
      required this.total,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Table(
        border: TableBorder.all(color: AppColors.kOtpBorderColor),
        children: [
          TableRow(children: [
            TableDetilsTexts(
              title: 'orderTime'.tr(),
              subTitle: orderDate,
            ),
            TableDetilsTexts(
              title: 'deliveryTime'.tr(),
              subTitle: deliveryDate,
            ),
          ]),
          TableRow(children: [
            TableDetilsTexts(title: 'orderTotal'.tr(), subTitle: total),
            TableDetilsTexts(
              doneDelivery: true,
              title: 'orderStatus'.tr(),
              subTitle: orderStatus(status),
            ),
          ]),
        ],
      ),
    );
  }
}
