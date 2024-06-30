import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routers/app_routers.dart';
import '../../../../core/utils/app_styles.dart';

class SkipText extends StatelessWidget {
  final bool? isActive;
  const SkipText({super.key, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return isActive == true
        ? Align(
            alignment: AlignmentDirectional.topStart,
            child: TextButton(
                onPressed: () {
                  GoRouter.of(context)
                      .pushReplacementNamed(AppRouters.loginView);
                },
                child: Text('skip'.tr(), style: AppStyle.textStyleBold18)),
          )
        : const SizedBox(height: 35);
  }
}
