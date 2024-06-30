import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class OrderStepperListTile extends StatelessWidget {
  final String title, subTitle;
  final Color? color;
  const OrderStepperListTile(
      {super.key, required this.title, required this.subTitle, this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppStyle.textStyleRegular14
            .copyWith(color: const Color(0xff8B959E)),
      ),
      subtitle: Text(
        subTitle,
        style: AppStyle.textStyleRegular14.copyWith(
            color: color ?? const Color(0xff45495E),
            fontWeight: FontWeight.bold),
      ),
      // SizedBox(height: 25.h),
    );
  }
}
