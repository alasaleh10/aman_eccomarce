import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class FollowOrderNumber extends StatelessWidget {
  final int orderNo;
  const FollowOrderNumber({super.key, required this.orderNo});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 5,
        title: Text(
          'trackingYourOrder'.tr(),
          textAlign: TextAlign.center,
          style: AppStyle.textStyleBold25.copyWith(
              fontWeight: FontWeight.w300, color: const Color(0xff8B959E)),
        ),
        subtitle: Text(
          '#$orderNo',
          textAlign: TextAlign.center,
          style: AppStyle.textStyleSemiBold20
              .copyWith(color: const Color(0xff45495E)),
        ),
      ),
    );
  }
}
