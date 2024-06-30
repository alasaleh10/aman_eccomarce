import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routers/app_routers.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../auth/prsentation/views/widgets/auth_loading.dart';
import '../../view_model/add_location_cuibt/add_location_cubit.dart';
import 'custom_divider_row.dart';
import 'google_map_stack.dart';

class AddLocationBodyView extends StatelessWidget {
  const AddLocationBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<AddLocationCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(child: GoogleMapStack()),
        CustomDividerRow(cubit: cuibt),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 15),
          child: Text(
            'currentLocation'.tr(),
            style: AppStyle.textStyleRegular16.copyWith(
                fontWeight: FontWeight.w300, color: const Color(0xff767C92)),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 15),
          child: BlocBuilder<AddLocationCubit, AddLocationState>(
              builder: (context, state) {
            return Text(
              cuibt.myCurrentLocation ?? '',
              style: AppStyle.textStyleRegular16,
              maxLines: 4,
            );
          }),
        ),
        const SizedBox(height: 15),
        Align(
            alignment: Alignment.center,
            child: BlocListener<AddLocationCubit, AddLocationState>(
              listener: (context, state) {
                if (state is AddLocationLoading2) {
                  showDialog(
                      context: context,
                      builder: (context) => const AuthLoading());
                } else if (state is AddLocationSucsess2) {
                  context.pop();
                  GoRouter.of(context).goNamed(AppRouters.homeScreenView);
                }
              },
              child: CustomElevatedButton(
                  title: 'confirmLocation'.tr(),
                  onPressed: () {
                    cuibt.confirmLocation();
                  }),
            )),
        const SizedBox(height: 15),
      ],
    );
  }
}
