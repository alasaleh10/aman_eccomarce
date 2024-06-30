import 'package:aman_store2/core/constins/const.dart';
import 'package:aman_store2/core/functions/decimal_price.dart';

import 'package:aman_store2/core/models/items_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/network_image.dart';

class HomeSearchItem extends StatelessWidget {
  final ItemsModel itemsModel;
  final bool isOrder;
  const HomeSearchItem(
      {super.key, this.isOrder = false, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.kOtpBorderColor),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
              child: Container(
            clipBehavior: Clip.antiAlias,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
            child: AspectRatio(
                aspectRatio: 1,
                child: NetWorkImageCached(
                  url: itemsModel.image ?? erroeImage,
                )),
          )),
          SizedBox(width: 20.w),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemsModel.name!,
                    style: AppStyle.textStyleBold18.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.kBlackColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  RichText(
                    text: TextSpan(
                        text: decimalNumer(price: itemsModel.price),
                        style: AppStyle.textStyleSemiBold20
                            .copyWith(color: AppColors.kPrimColor),
                        children: [
                          WidgetSpan(child: SizedBox(width: 8.w)),
                          TextSpan(text: 'ry2'.tr())
                        ]),
                  ),
                  // HomeSearchItemDiscountContiner(
                  //     isOrder: isOrder,
                  //     cartCount: 3,
                  //     discount: 15,
                  //     id: 1,
                  //     oldPrice: 3965)
                ],
              ))
        ],
      ),
    );
  }
}
