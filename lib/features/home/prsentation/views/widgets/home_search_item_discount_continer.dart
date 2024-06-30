import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import 'item_add_to_cart_button.dart';

class HomeSearchItemDiscountContiner extends StatelessWidget {
  final bool isOrder;
  final int cartCount, id, oldPrice, discount;
  const HomeSearchItemDiscountContiner(
      {super.key,
      required this.cartCount,
      required this.id,
      required this.oldPrice,
      required this.discount,
      required this.isOrder});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$oldPrice ${'ry2'.tr()}',
              style: AppStyle.textStyleRegular16.copyWith(
                  color: const Color(0xffCACACA),
                  decoration: TextDecoration.lineThrough,
                  decorationColor: const Color(0xffCACACA)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              '${'discount'.tr()} $discount%',
              style: AppStyle.textStyleBold12,
            ),
          ),
          const SizedBox(width: 15),
          if (isOrder == false)
            const Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 5),
                  child: ItemAddToCartButton(
                    horizontal: 0,
                    vertical: 0,

                    // vertical: 1,
                    id: 5,
                  ),
                  //  HomeSearchItemCartCounter(count: cartCount, id: id),
                ))
        ],
      ),
    );
  }
}
