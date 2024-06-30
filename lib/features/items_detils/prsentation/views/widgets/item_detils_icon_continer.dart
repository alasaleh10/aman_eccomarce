import 'package:aman_store2/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContinerIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  const CustomContinerIcon(
      {super.key, required this.icon, required this.onTap, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 37.h,
        width: 37.w,
        decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.3),
                spreadRadius: .2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            shape: BoxShape.circle),
        child: Icon(
          icon,
          color: iconColor,
          size: 25,
        ),
      ),
    );
  }
}
