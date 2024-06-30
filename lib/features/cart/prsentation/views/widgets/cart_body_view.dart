import 'package:aman_store2/features/cart/prsentation/views/pay_cart_view.dart';
import 'package:flutter/material.dart';

import '../cart_delivery_view.dart';
import '../cart_prodects.dart';
import 'cart_stepper_row_continers.dart';

class CartBodyView extends StatelessWidget {
  const CartBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const CartStepperRowContiners(),
        const Divider(),
        Expanded(
            child: PageView(
                // physics: const NeverScrollableScrollPhysics(),
                children: const [
              CartProdectsView(),
              CartDeliveryView(),
              PayCartView()
            ])),
      ],
    );
  }
}
