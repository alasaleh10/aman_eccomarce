import 'package:aman_store2/core/models/items_model.dart';
import 'package:aman_store2/core/routers/app_routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constins/const.dart';
import '../../../../../core/functions/decimal_price.dart';
import '../../../../../core/utils/app_colors.dart';

import 'item_add_to_cart_button.dart';
import 'item_image_stack.dart';
import 'items_title_and_price.dart';

class HomeItemsContiner extends StatelessWidget {
  final ItemsModel itemsModel;
  const HomeItemsContiner({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouters.itemDetilsView,
            extra: itemsModel.id!.toInt());
      },
      child: Container(
        // height: 288.h,
        width: 160.w,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kOtpBorderColor),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemImageStack(
              isFaviorte: itemsModel.inFavorites!,
              image: itemsModel.image ?? erroeImage,
              id: 2,
            ),
            SizedBox(height: 8.h),
            ItemsTitleAndPrice(
              title: itemsModel.name ?? '',
              subTitle: itemsModel.description ?? '',
              price: decimalNumer(price: itemsModel.price),
            ),
            SizedBox(height: 8.h),
            SizedBox(
                width: 150.w,
                child: const FittedBox(child: ItemAddToCartButton(id: 2)))
          ],
        ),
      ),
    );
  }
}
