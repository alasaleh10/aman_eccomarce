import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routers/app_routers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../data/on_bording_list_items.dart';
import '../../view_model/on_bording_cuibt/on_bording_cubit.dart';

class OnBordingBottomBar extends StatelessWidget {
  const OnBordingBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, right: 15, left: 15),
      child: BlocBuilder<OnBordingCubit, OnBordingState>(
        buildWhen: (previous, current) => current is OnBordingInitial,
        builder: (context, state) {
          final cuibt = BlocProvider.of<OnBordingCubit>(context);
          return CustomElevatedButton(
            backgroundColor: AppColors.kPrimColor5,
            textColor: AppColors.kPrimColor,
            title: cuibt.index == onbordingItems.length - 1
                ? 'lestGo'.tr()
                : 'next'.tr(),
            onPressed: () {
              if (cuibt.index == onbordingItems.length - 1) {
                GoRouter.of(context).pushReplacementNamed(AppRouters.loginView);
              } else {
                cuibt.changePage();
              }
            },
          );
        },
      ),
    );
  }
}
