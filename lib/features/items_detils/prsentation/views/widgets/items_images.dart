import 'package:aman_store2/core/models/items_model.dart';
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/network_image.dart';
import 'item_detils_icon_continer.dart';

class ItemsImages extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsImages({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: SizedBox(
        height: 265.h,
        width: 308.w,
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Swiper(
              outer: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  child: NetWorkImageCached(
                    url: itemsModel.images![index],
                  ),
                );
              },
              scale: .2,
              itemCount: itemsModel.images!.length,
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: AppColors.kPrimColor.withOpacity(.5),
                      activeSize: 13,
                      activeColor: AppColors.kPrimColor)),
            ),
            Positioned(
              top: 10.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    CustomContinerIcon(
                      onTap: () {},
                      icon: Icons.share_outlined,
                    ),
                    SizedBox(height: 11.h),
                    CustomContinerIcon(
                      iconColor: AppColors.kPrimColor,
                      onTap: () {},
                      icon: Icons.favorite,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// 0نقدي
// 1 اونلاين
