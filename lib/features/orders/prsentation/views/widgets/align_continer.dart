import '../../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AlignContiner extends StatelessWidget {
  final Animation<AlignmentDirectional> animation2;
  const AlignContiner({super.key, required this.animation2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AlignTransition(
        alignment: animation2,
        child: SizedBox(
          height: 50,
          child: AspectRatio(
            aspectRatio: 3 / 1.2,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kPrimColor.withOpacity(.3),
                      spreadRadius: 1,
                      blurRadius: 30,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  color: AppColors.kPrimColor,
                  borderRadius: BorderRadius.circular(160)),
            ),
          ),
        ),
      ),
    );
  }
}
