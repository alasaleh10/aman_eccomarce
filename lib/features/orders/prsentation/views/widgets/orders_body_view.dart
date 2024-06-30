import '../../../../../core/utils/app_colors.dart';
import '../../view_model/orders_cuibt/orders_cubit.dart';
import 'current_orders.dart';
import 'old_orders.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'orders_top_continer.dart';

class OrdersBodyView extends StatefulWidget {
  const OrdersBodyView({super.key});

  @override
  State<OrdersBodyView> createState() => _OrdersBodyViewState();
}

class _OrdersBodyViewState extends State<OrdersBodyView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation1;
  late Animation animationColor1;
  late Animation animationColor2;
  late Animation<AlignmentDirectional> alignAnimation;

  //
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    alineAnimation();
    colorAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OrdersCubit>(context);
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: Divider()),
        OrdersTopContiner(
          controller: controller,
          animationColor1: animationColor1,
          animationColor2: animationColor2,
          alignAnimation: alignAnimation,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 15)),
        SliverFillRemaining(
          child: PageView(
            controller: cubit.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [CurrentOrders(), OldOrders()],
          ),
        ),
      ],
    );
  }

  void alineAnimation() {
    alignAnimation = Tween<AlignmentDirectional>(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd)
        .animate(controller);
  }

  void colorAnimation() {
    animationColor1 =
        ColorTween(begin: AppColors.kWhiteColor, end: AppColors.kBlackColor)
            .animate(controller);
    animationColor2 =
        ColorTween(begin: AppColors.kBlackColor, end: AppColors.kWhiteColor)
            .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
