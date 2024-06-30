import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routers/app_routers.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class HomeNewAmanContiner extends StatelessWidget {
  const HomeNewAmanContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushNamed(AppRouters.homeAmanView);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: const Color(0xffFEF1E5),
              border: Border.all(color: AppColors.kPrimColor),
              borderRadius: BorderRadius.circular(35)),
          child: ListTile(
            leading: SvgPicture.asset(Assets.imagesNew),
            title: Text(
              'newAmanStore'.tr(),
              style: AppStyle.textStyleRegular16
                  .copyWith(color: AppColors.kPrimColor),
            ),
            trailing: const Icon(
              Icons.arrow_forward,
              size: 30,
              color: AppColors.kPrimColor,
            ),
          ),
        ),
      ),
    );
  }
}
