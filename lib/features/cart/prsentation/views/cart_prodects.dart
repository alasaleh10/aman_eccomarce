import 'package:aman_store2/core/functions/decimal_price.dart';
import 'package:aman_store2/core/widgets/custom_loading.dart';
import 'package:aman_store2/core/widgets/failure_column.dart';
import 'package:aman_store2/features/cart/prsentation/view_model/p_cart_cuibt/p_cart_cubit.dart';
import 'package:aman_store2/features/cart/prsentation/views/widgets/p_cart_add_more.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/cart_next_button.dart';
import 'widgets/p_cart_items.dart';

class CartProdectsView extends StatelessWidget {
  const CartProdectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PCartCubit, PCartState>(
      buildWhen: (previous, current) =>
          current is! PCartMessage && current is! PCartSucsess2,
      builder: (context, state) {
        if (state is PCartFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FailureColumn(
                    errorMessage: state.message,
                    onPressed: () {
                      BlocProvider.of<PCartCubit>(context).getCart(context);
                    }),
                SizedBox(height: 20.h),
                const PCartAddMore()
              ],
            ),
          );
        } else if (state is PCartSucess) {
          return CustomScrollView(
            slivers: [
              SliverList.builder(
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: PCartItems(
                        cartItem: state.carts.cartItems![index],
                      ));
                },
                itemCount: state.carts.cartItems!.length,
              ),
              SliverToBoxAdapter(child: SizedBox(height: 25.h)),
              const SliverToBoxAdapter(child: PCartAddMore()),
              SliverToBoxAdapter(
                  child: CartNextButton(
                      onPressed: () {},
                      price: decimalNumer(price: state.carts.total)))
            ],
          );
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}
