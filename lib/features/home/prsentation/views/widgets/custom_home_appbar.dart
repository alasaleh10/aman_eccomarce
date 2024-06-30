import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helper/responsive_helper/screen_height.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/widgets/custom_notification.dart';
import 'home_appbar_logo.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: screenHeight(context) * .15,
      flexibleSpace: const FlexibleSpaceBar(
        background: HomeAppBarLogo(),
      ),
      leading: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: SvgPicture.asset(
          Assets.imagesDrwer,
          height: 50,
          width: 50,
          fit: BoxFit.scaleDown,
        ),
      ),
      actions: const [CustomNotificationIcon()],
    );
  }
}
