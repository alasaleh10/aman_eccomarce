import 'package:aman_store2/core/functions/decimal_price.dart';
import 'package:aman_store2/core/models/items_model.dart';
import 'package:aman_store2/core/utils/app_colors.dart';
import 'package:aman_store2/core/utils/app_styles.dart';
import 'package:aman_store2/core/widgets/custom_loading.dart';
import 'package:aman_store2/core/widgets/failure_column.dart';
import 'package:aman_store2/features/items_detils/prsentation/view_model/item_detils_cuibt/item_detils_cubit.dart';
import 'package:aman_store2/features/items_detils/prsentation/views/widgets/add_item_to_cart.dart';
import 'package:aman_store2/features/items_detils/prsentation/views/widgets/items_images.dart';
import 'package:animate_do/animate_do.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'item_price.dart';

class ItemDetilsBodyView extends StatelessWidget {
  final int itemId;
  const ItemDetilsBodyView({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocBuilder<ItemDetilsCubit, ItemDetilsState>(
          buildWhen: (previous, current) => current is !ItemDetilsFailure2 && current is !ItemDetilsSucsess2,
          builder: (context, state) {
            if (state is ItemDetilsFailure) {
              return FailureColumn(
                  errorMessage: state.message,
                  onPressed: () {
                    BlocProvider.of<ItemDetilsCubit>(context)
                        .getItemDetils(itemId: itemId);
                  });
            } else if (state is ItemDetilsSucsess) {
              ItemsModel itemsModel = state.itemsModel;

              return ZoomIn(
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.h),
                    Text(
                      itemsModel.name!,
                      style: AppStyle.textStyleBold22,
                    ),
                    Text(
                      '# ${itemsModel.id}',
                      style: AppStyle.textStyleBold22
                          .copyWith(color: AppColors.kPrimColor),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.h),
                    const Divider(),
                    SizedBox(height: 25.h),
                    ItemsImages(
                      itemsModel: itemsModel,
                    ),
                    ProductPrice(
                      oldPrice: decimalNumer(price: itemsModel.oldPrice),
                      discount: itemsModel.discount,
                      price: decimalNumer(price: itemsModel.price),
                    ),
                    const Divider(),
                    Text(
                      'procuctDetils'.tr(),
                      style: AppStyle.textStyleBold18
                          .copyWith(color: AppColors.kBlackColor),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      itemsModel.description!,
                      style: AppStyle.textStyleRegular14
                          .copyWith(color: const Color(0xff45495E), height: 2),
                    ),
                    SizedBox(height: 15.h),
                  AddItemToCart(isCart: itemsModel.inCart!, id: itemsModel.id!.toInt()),

                    
                    SizedBox(height: 10.h)
                    //
                  ],
                ),
              );
            } else {
              return const CustomLoading();
            }
          },
        ));
  }
}
