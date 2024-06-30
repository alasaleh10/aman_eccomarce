import 'package:aman_store2/core/functions/display_snackbar.dart';
import 'package:aman_store2/features/cart/prsentation/view_model/p_cart_cuibt/p_cart_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class PCartItemsAddCartContiner extends StatelessWidget {
  final int count;
  final num counter, cartId;
  const PCartItemsAddCartContiner(
      {super.key,
      required this.counter,
      required this.cartId,
      required this.count});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<PCartCubit>(context);
    return BlocListener<PCartCubit, PCartState>(
      listener: (context, state) {
        if (state is PCartMessage) {
          displaySnackBar(context, message: state.message, isError: false);
        } else if (state is PCartSucsess2) {
          cuibt.getCart(context, isFromProcess: true);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: 90.w,
        height: 42.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kOtpBorderColor),
            borderRadius: BorderRadius.circular(20.r)),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    if (count == 1) {
                      cuibt.deleteFromCart(context, cartId: cartId.toInt());
                    } else {
                      int newcount = count - 1;
                      cuibt.upDateQuantity(context,
                          quantity: newcount, cartId: cartId.toInt());
                    }
                  },
                  child: const Icon(Icons.remove)),
              SizedBox(height: 42.h, child: const VerticalDivider()),
              Text(
                '$counter',
                style: AppStyle.textStyleRegular16,
              ),
              SizedBox(height: 42.h, child: const VerticalDivider()),
              GestureDetector(
                  onTap: () {
                    int newcount = count + 1;
                    cuibt.upDateQuantity(context,
                        quantity: newcount, cartId: cartId.toInt());
                  },
                  child: const Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }
}
