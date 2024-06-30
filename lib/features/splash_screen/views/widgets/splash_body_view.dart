import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routers/app_routers.dart';
import '../../../../core/utils/app_assets.dart';

class SplashBodyView extends StatefulWidget {
  const SplashBodyView({super.key});

  @override
  State<SplashBodyView> createState() => _SplashBodyViewState();
}

class _SplashBodyViewState extends State<SplashBodyView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    initAnimation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, _) {
          return AnimatedOpacity(
            opacity: animation.value,
            duration: const Duration(seconds: 3),
            child: Image.asset(
              Assets.imagesLogo1,
            ),
          );
        },
      ),
    );
  }

  void initAnimation() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();

    goOnBording();
  }

  void goOnBording() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacementNamed(AppRouters.onBordingView);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
