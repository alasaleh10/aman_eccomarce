import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class OffersTitleContiner extends StatelessWidget {
  final String title;
  const OffersTitleContiner({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.kWhiteColor.withOpacity(.4)),
      child: Text(
        title,
        style: AppStyle.textStyleBold18.copyWith(
            color: AppColors.kWhiteColor, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}
