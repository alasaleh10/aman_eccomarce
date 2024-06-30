import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CartSteperContiner extends StatelessWidget {
  final String title, image;
  final bool isActive;
  const CartSteperContiner({
    super.key,
    required this.title,
    required this.image,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(
                  color: isActive
                      ? AppColors.kPrimColor
                      : AppColors.kOtpBorderColor,
                  width: 2),
              shape: BoxShape.circle),
          child: SvgPicture.asset(
            image,
            colorFilter: ColorFilter.mode(
                isActive ? AppColors.kPrimColor : const Color(0xff8B959E),
                BlendMode.srcIn),
            height: 23,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: AppStyle.textStyleBold12.copyWith(
              color: isActive ? AppColors.kPrimColor : const Color(0xff8B959E)),
        )
      ],
    );
  }
}
