import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../view_model/add_location_cuibt/add_location_cubit.dart';

class CustomDividerRow extends StatelessWidget {
  final AddLocationCubit cubit;
  CustomDividerRow({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            colors.length,
            (index) => Expanded(
                    child: Divider(
                  // height: 20,
                  thickness: 15,
                  color: colors[index],
                )))
      ],
    );
  }

  final List<Color> colors = [
    AppColors.kPrimColor,
    const Color(0xffFFA04A),
    const Color(0xffFFB777),
    const Color(0xffFFD2AA)
  ];
}
