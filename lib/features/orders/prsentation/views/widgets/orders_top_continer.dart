import 'align_continer.dart';
import 'orders_row_top_continer.dart';

import 'package:flutter/material.dart';

class OrdersTopContiner extends StatelessWidget {
  final Animation<dynamic> animationColor1, animationColor2;
  final AnimationController controller;
  final Animation<AlignmentDirectional> alignAnimation;
  const OrdersTopContiner(
      {super.key,
      required this.alignAnimation,
      required this.animationColor1,
      required this.animationColor2,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(160)),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: IntrinsicHeight(
              child: Stack(
                // alignment: Alignment.center,
                // clipBehavior: Clip.none/,
                children: [
                  AlignContiner(animation2: alignAnimation),
                  OrdersRowTopContiners(
                      controller: controller,
                      animationColor1: animationColor1,
                      animationColor2: animationColor2)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
