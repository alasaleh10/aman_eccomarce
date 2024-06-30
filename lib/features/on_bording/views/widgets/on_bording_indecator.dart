import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OnBordingIndecator extends StatelessWidget {
  final int indecatorIndex;
  const OnBordingIndecator({super.key, required this.indecatorIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            3,
            (index) => Container(
                  height: 9,
                  width: 13,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == indecatorIndex
                          ? AppColors.kPrimColor5
                          : const Color(0xffF8B273)),
                ))
      ],
    );
  }
}
