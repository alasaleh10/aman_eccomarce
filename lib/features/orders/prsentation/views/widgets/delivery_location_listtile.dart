import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class DeliveryLocationListTile extends StatelessWidget {
  final String deliveryLocation;
  const DeliveryLocationListTile({super.key, required this.deliveryLocation});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kOtpBorderColor),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: ListTile(
          // dense: true,
          // minVerticalPadding: 50,
          // contentPadding: EdgeInsets.zero,
          title: Text(
            'delivAddress'.tr(),
            style: AppStyle.textStyleRegular14.copyWith(
                color: const Color(0xff8B959E), fontWeight: FontWeight.w300),
          ),
          subtitle: Text(
            deliveryLocation,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.textStyleRegular14.copyWith(
                fontWeight: FontWeight.bold, color: const Color(0xff45495E)),
          ),
        ),
      ),
    );
  }
}
