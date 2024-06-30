import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        IconButton(
            onPressed: () {
              // GoRouter.of(context).pushNamed(Routers.notification);
            },
            icon: SvgPicture.asset(Assets.imagesNotifcation)),
        Positioned(
          top: 5,
          right: 2,
          // right: isArabick(context) ? null : 2,
          // left: isArabick(context) ? 2 : null,
          child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: AppColors.kPrimColor.withOpacity(.5),
                  spreadRadius: 10,
                  blurRadius: 15,
                  offset: const Offset(0, 0),
                ),
              ], borderRadius: BorderRadius.circular(360)),
              child: const CircleAvatar(
                backgroundColor: AppColors.kPrimColor,
                radius: 10,
                child: Center(
                    child: Text(
                  '1',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )),
              )),
        )
      ],
    );
  }
}
