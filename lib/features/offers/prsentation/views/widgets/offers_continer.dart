import 'package:flutter/material.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class OffersContiner extends StatelessWidget {
  final int offer;
  const OffersContiner({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: isArabick(context) ? 10 : null,
      left: isArabick(context) ? null : 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: const BoxDecoration(
            color: Color(0xffF75254), shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Offer',
                style: AppStyle.textStyleRegular14.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.kWhiteColor)),
            Text('$offer%',
                style: AppStyle.textStyleSemiBold23
                    .copyWith(color: AppColors.kWhiteColor)),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
