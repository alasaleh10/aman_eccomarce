import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_styles.dart';

class AccountCustomListTile extends StatelessWidget {
  final String title, image;
  final VoidCallback onTap;
  const AccountCustomListTile(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListTile(
        onTap: onTap,
        dense: true,
        // contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(image),
        title: Text(
          title,
          style:
              AppStyle.textStyleBold18.copyWith(color: const Color(0xff45495E)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
