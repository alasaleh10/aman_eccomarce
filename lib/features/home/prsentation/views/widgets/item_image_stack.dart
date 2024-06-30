import 'package:aman_store2/core/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class ItemImageStack extends StatelessWidget {
  final bool isFaviorte;
  final String image;
  final int id;
  const ItemImageStack(
      {super.key,
      required this.image,
      required this.id,
      required this.isFaviorte});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          height: 141.h,
          width: 163.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: NetWorkImageCached(url: image),
        ),
        Positioned(
          top: 13.h,
          child: Container(
            padding: const EdgeInsets.all(8),
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
              isFaviorte ? Icons.favorite : Icons.favorite_border_rounded,
              color: AppColors.kPrimColor,
            ),
          ),
        )
      ],
    );
  }
}
