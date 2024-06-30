import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../view_model/on_bording_cuibt/on_bording_cubit.dart';
import 'widgets/on_bording_body_view.dart';
import 'widgets/on_bording_bottom_bar.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBordingCubit(),
      child: const Scaffold(
        backgroundColor: AppColors.kPrimColor,
        bottomNavigationBar: OnBordingBottomBar(),
        body: SafeArea(child: OnBordingBodyView()),
      ),
    );
  }
}
