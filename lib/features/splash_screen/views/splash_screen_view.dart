import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import 'widgets/splash_body_view.dart';
import 'widgets/splash_bottok_bar.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimColor,
      bottomNavigationBar: SplashBottomImages(),
      body: SplashBodyView(),
    );
  }
}
