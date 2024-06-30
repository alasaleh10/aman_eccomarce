import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountTopContiner extends StatelessWidget {
  final String title, subTitle, image;
  final Color backgroundColor, imageColor;
  final VoidCallback onTap;
  const AccountTopContiner(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.backgroundColor,
      required this.onTap,
      required this.imageColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.kOtpBorderColor)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: backgroundColor, shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.asset(
                    image,
                    colorFilter: ColorFilter.mode(imageColor, BlendMode.srcIn),
                  ),
                ),
              ),
              Text(
                title,
                style: AppStyle.textStyleSemiBold15,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                subTitle,
                style: AppStyle.textStyleSemiBold15.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff8B959E)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
