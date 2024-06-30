import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class HomeNewAmanAppBar extends StatelessWidget {
  const HomeNewAmanAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'newAmanStore'.tr(),
        style: AppStyle.textStyleSemiBold20,
      ),
    );
  }
}
