import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import 'widgets/follow_order_body_view.dart';

class FollowOrderView extends StatelessWidget {
  const FollowOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'trackingYourOrder'.tr(),
          style: AppStyle.textStyleSemiBold20,
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(20.h), child: const Divider()),
      ),
      body: const FollowOrderBodyView(),
    );
  }
}
