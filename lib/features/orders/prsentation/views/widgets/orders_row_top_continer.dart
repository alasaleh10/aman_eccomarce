import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../view_model/orders_cuibt/orders_cubit.dart';

class OrdersRowTopContiners extends StatelessWidget {
  final AnimationController controller;
  final Animation<dynamic> animationColor1, animationColor2;

  const OrdersRowTopContiners(
      {super.key,
      required this.animationColor1,
      required this.animationColor2,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: animationColor1,
              builder: (BuildContext context, _) {
                return GestureDetector(
                  onTap: () {
                    if (!controller.isCompleted) return;
                    BlocProvider.of<OrdersCubit>(context).changepage(index: 0);

                    controller.reverse();
                  },
                  child: Text(
                    'presnet'.tr(),
                    style: AppStyle.textStyleRegular16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: animationColor1.value),
                  ),
                );
              },
            ),
            const Spacer(),
            AnimatedBuilder(
              animation: animationColor2,
              builder: (BuildContext context, _) {
                return GestureDetector(
                  onTap: () {
                    // if (controller.isCompleted) return;

                    controller.forward();
                    BlocProvider.of<OrdersCubit>(context).changepage(index: 1);
                  },
                  child: Text(
                    'previous'.tr(),
                    style: AppStyle.textStyleRegular16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: animationColor2.value),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
