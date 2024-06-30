import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class RatingFace extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final bool animate;

  final VoidCallback onTap;
  const RatingFace(
      {super.key,
      required this.isActive,
      required this.icon,
      required this.onTap,
      required this.animate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: onTap,
        child: ElasticIn(
          duration: const Duration(milliseconds: 1000),
          animate: animate,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 39.h,
                width: 39.w,
                // padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xffFEF1E5)
                        : const Color(0xffF4F4F4),
                    shape: BoxShape.circle),
              ),
              Icon(
                icon,
                size: 50.r,
                color:
                    isActive ? AppColors.kPrimColor : const Color(0xff707070),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
