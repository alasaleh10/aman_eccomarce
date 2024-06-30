import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../home_screen/view_model/home_screen_cuibt/home_screen_cubit.dart';

class OffersAppBar extends StatelessWidget {
  const OffersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: GestureDetector(
          onTap: () {
            BlocProvider.of<HomeScreenCubit>(context).goLastPage();
          },
          child: const Icon(Icons.arrow_back)),
      title: Text(
        'offers'.tr(),
        style: AppStyle.textStyleSemiBold20,
      ),
    );
  }
}
