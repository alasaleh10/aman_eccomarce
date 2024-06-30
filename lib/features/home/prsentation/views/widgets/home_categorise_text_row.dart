import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routers/app_routers.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class HomeCategoriseTextRow extends StatelessWidget {
  const HomeCategoriseTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'browesCategorisess'.tr(),
                style: AppStyle.textStyleBold17,
              ),
              const SizedBox(height: 8),
              Text(
                'allneeds'.tr(),
                style: AppStyle.textStyleRegular14
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.pushNamed(AppRouters.homeAllCategorisesView);
            },
            child: Text(
              'allcategorises'.tr(),
              style: AppStyle.textStyleRegular16.copyWith(
                  color: AppColors.kPrimColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.kPrimColor),
            ),
          )
        ],
      ),
    );
  }
}
