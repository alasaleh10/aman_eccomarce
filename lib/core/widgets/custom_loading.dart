import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator.adaptive(
      backgroundColor: AppColors.kPrimColor,
    ));
  }
}