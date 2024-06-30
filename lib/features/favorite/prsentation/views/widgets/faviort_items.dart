import 'package:aman_store2/core/routers/app_routers.dart';
import 'package:aman_store2/features/favorite/prsentation/views/widgets/faviorte_remove_faviorte.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constins/const.dart';
import '../../../../../core/functions/decimal_price.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/network_image.dart';
import '../../../data/models/faviort_model/faviort_model.dart';

class FaviorteItems extends StatelessWidget {
  final FaviortModel items;
  const FaviorteItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouters.itemDetilsView,
            extra: items.product!.id!.toInt());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kOtpBorderColor),
            borderRadius: BorderRadius.circular(10.r)),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: 94.h,
                  width: 100.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  child: NetWorkImageCached(
                    url: items.product!.image ?? erroeImage,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items.product!.name!,
                      style: AppStyle.textStyleRegular16
                          .copyWith(color: AppColors.kBlackColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    RichText(
                        text: TextSpan(
                            style: AppStyle.textStyleBold22
                                .copyWith(color: AppColors.kPrimColor),
                            text: decimalNumer(price: items.product!.price),
                            children: [
                          WidgetSpan(
                              child: SizedBox(
                            width: 5.w,
                          )),
                          TextSpan(
                              style: AppStyle.textStyleRegular14
                                  .copyWith(color: AppColors.kPrimColor),
                              text: 'ry'.tr())
                        ])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        items.product!.discount == 0
                            ? const SizedBox()
                            : RichText(
                                text: TextSpan(
                                    style: AppStyle.textStyleRegular16.copyWith(
                                        color: AppColors.kOtpBorderColor),
                                    text: decimalNumer(
                                        price: items.product!.oldPrice),
                                    children: [
                                    WidgetSpan(
                                        child: SizedBox(
                                      width: 5.w,
                                    )),
                                    TextSpan(
                                        style: AppStyle.textStyleRegular14
                                            .copyWith(
                                                color:
                                                    AppColors.kOtpBorderColor,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                        text: 'ry'.tr())
                                  ])),
                      ],
                    )
                  ],
                ))
              ],
            ),
            FaviorteRmove(itemId: items.product!.id!.toInt())
          ],
        ),
      ),
    );
  }
}
