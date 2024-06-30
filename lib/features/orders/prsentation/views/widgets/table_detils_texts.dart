import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class TableDetilsTexts extends StatelessWidget {
  final String title, subTitle;
  final bool doneDelivery, isDelivering;

  const TableDetilsTexts(
      {super.key,
      required this.title,
      required this.subTitle,
      this.doneDelivery = false,
      this.isDelivering = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            title,
            style: AppStyle.textStyleRegular14
                .copyWith(color: const Color(0xff8B959E)),
          ),
          const SizedBox(height: 8),
          Text(
            subTitle,
            style: AppStyle.textStyleRegular14.copyWith(
                color: doneDelivery
                    ? Colors.green
                    : isDelivering
                        ? AppColors.kPrimColor
                        : const Color(0xff45495E),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
