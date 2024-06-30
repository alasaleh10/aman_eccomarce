import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routers/app_routers.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class EditAccountContiner extends StatelessWidget {
  const EditAccountContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * .3),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushNamed(AppRouters.editMyDataView);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.kPrimColor)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.settings,
                color: AppColors.kPrimColor,
              ),
              const SizedBox(width: 9),
              Text(
                'editmyData'.tr(),
                style: AppStyle.textStyleRegular16.copyWith(
                    color: AppColors.kPrimColor, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
