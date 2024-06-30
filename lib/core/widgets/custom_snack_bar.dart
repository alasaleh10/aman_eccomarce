import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

SnackBar customSnackBar(BuildContext context,
    {required String title, bool isError = true}) {
  return SnackBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side:
              BorderSide(color: isError ? AppColors.kPrimColor : Colors.green)),
      backgroundColor: AppColors.kWhiteColor,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: AppStyle.textStyleRegular16,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              isError ? Icons.error : Icons.done,
              color: isError ? Colors.red : Colors.green,
              size: 30,
            )
          ],
        ),
      ));
}
