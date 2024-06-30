import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class NewAmanViewContiner extends StatelessWidget {
  const NewAmanViewContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: const Color(0xffFEF1E5),
              border: Border.all(color: AppColors.kPrimColor),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            dense: true,
            leading: SvgPicture.asset(Assets.imagesNew),
            title: Text(
              'newAmanStore'.tr(),
              style: AppStyle.textStyleRegular16
                  .copyWith(color: AppColors.kPrimColor),
            ),
          ),
        ),
      ),
    );
  }
}
