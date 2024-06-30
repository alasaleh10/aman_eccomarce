import 'package:aman_store2/core/constins/const.dart';
import 'package:aman_store2/core/functions/decimal_price.dart';
import 'package:aman_store2/core/routers/app_routers.dart';
import 'package:aman_store2/core/utils/app_colors.dart';
import 'package:aman_store2/core/utils/app_styles.dart';
import 'package:aman_store2/core/widgets/network_image.dart';
import 'package:aman_store2/features/cart/prsentation/views/widgets/p_cart_item_faviorte.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/p_cart_model/cart_item.dart';
import 'p_cart_item_add_cart_continer.dart';

class PCartItems extends StatelessWidget {
  final CartItem cartItem;

  const PCartItems({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouters.itemDetilsView,
            extra: cartItem.product!.id!.toInt());
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
                    url: cartItem.product!.image ?? erroeImage,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.product!.name!,
                      style: AppStyle.textStyleRegular16
                          .copyWith(color: AppColors.kBlackColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    RichText(
                        text: TextSpan(
                            style: AppStyle.textStyleBold22
                                .copyWith(color: AppColors.kPrimColor),
                            text: decimalNumer(price: cartItem.product!.price),
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
                        cartItem.product!.discount == 0
                            ? const SizedBox()
                            : RichText(
                                text: TextSpan(
                                    style: AppStyle.textStyleRegular16.copyWith(
                                        color: AppColors.kOtpBorderColor),
                                    text: decimalNumer(
                                        price: cartItem.product!.price),
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
                        PCartItemsAddCartContiner(
                          count: cartItem.quantity!.toInt(),
                          counter: cartItem.quantity!,
                          cartId: cartItem.id!.toInt(),
                        ),
                      ],
                    )
                  ],
                ))
              ],
            ),
            PCartItemFaviore(
                itemId: cartItem.product!.id!.toInt(),
                isFav: cartItem.product!.inFavorites!)
          ],
        ),
      ),
    );
  }
}
