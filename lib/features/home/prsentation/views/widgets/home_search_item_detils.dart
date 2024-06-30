import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class HomeSearchItemCartCounter extends StatelessWidget {
  final int id, count;
  const HomeSearchItemCartCounter(
      {super.key, required this.id, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.kOtpBorderColor),
          borderRadius: BorderRadius.circular(16)),
      child: IntrinsicHeight(
        child: Row(
          children: [
            const Icon(Icons.add),
            const VerticalDivider(color: AppColors.kOtpBorderColor),
            Text(
              count.toString(),
              style: AppStyle.textStyleRegular16
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const VerticalDivider(
              color: AppColors.kOtpBorderColor,
            ),
            const Icon(Icons.remove)
          ],
        ),
      ),
    );
  }
}
