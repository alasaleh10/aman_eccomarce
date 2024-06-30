import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class DrwerListTile extends StatelessWidget {
  final String image, title;
  final VoidCallback onTap;

  const DrwerListTile(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title,
          style: AppStyle.textStyleRegular16
              .copyWith(color: AppColors.kPrimColor5)),
      leading: SvgPicture.asset(
        image,
        height: 25,
        width: 25,
        // ignore: deprecated_member_use
        color: Colors.white,
      ),
    );
  }
}
