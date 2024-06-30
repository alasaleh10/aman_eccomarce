import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class RowAccountAuth extends StatelessWidget {
  final String title1;
  final String title2;
  final VoidCallback onPressed;

  const RowAccountAuth(
      {super.key,
      required this.title1,
      required this.title2,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title1, style: AppStyle.textStyleRegular16

            // textStyl16.copyWith(color: Colors.black),
            ),
        TextButton(
            onPressed: onPressed,
            child: Text(title2,
                style: AppStyle.textStyleRegular16.copyWith(
                  color: AppColors.kPrimColor,
                )))
      ],
    );
  }
}
