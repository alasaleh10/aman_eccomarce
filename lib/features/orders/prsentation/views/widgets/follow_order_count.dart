import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/functions/product_counter.dart';
import '../../../../../core/utils/app_styles.dart';

class FollowOrderCount extends StatelessWidget {
  final int count;
  const FollowOrderCount({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        title: Text(
          'numberOfProducts'.tr(),
          style: AppStyle.textStyleBold25.copyWith(
              fontWeight: FontWeight.w300, color: const Color(0xff8B959E)),
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          productCounter(count: count),
          style: AppStyle.textStyleSemiBold20
              .copyWith(color: const Color(0xff45495E)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
