import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/functions/show_snac_bar.dart';
import '../../../../../core/routers/app_routers.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../view_model/confirm_email_cuibt/confirm_email_cubit.dart';
import 'auth_loading.dart';
import 'otp_text_fildes.dart';
import 'send_code_row.dart';

class ConfirmEmailBodyView extends StatelessWidget {
  final int index;
  final String email;
  const ConfirmEmailBodyView(
      {super.key, required this.email, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .1),
        Text(index == 0 ? 'confirmphone'.tr() : 'restText'.tr(),
            style: AppStyle.textStyleBold30, textAlign: TextAlign.center),
        const SizedBox(height: 15),
        Text(
          '${'sendCode'.tr()}\n$email',
          style: AppStyle.textStyleRegular16,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        const CustomTextFailedOtp(),
        const SizedBox(height: 15),
        const SendCodeRow(),
        const SizedBox(height: 20),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocListener<ConfirmEmailCubit, ConfirmEmailState>(
              listener: (context, state) {
                if (state is ConfirmEmailLoading) {
                  showDialog(
                      context: context,
                      builder: (context) => const AuthLoading());
                } else if (state is ConfirmEmailFailure) {
                  showSnackBar(context, message: state.errorMessage);
                } else if (state is ConfirmEmailSucsess) {
                  context.pop();
                  if (index == 0) {
                    GoRouter.of(context).goNamed(AppRouters.addLocationView);
                  } else if (index == 1) {
                    GoRouter.of(context).pushNamed(AppRouters.restPasswordView);
                  }
                }
              },
              child: CustomElevatedButton(
                  title: 'confirm'.tr(),
                  onPressed: () {
                    BlocProvider.of<ConfirmEmailCubit>(context).confirmEmail();
                  }),
            )),
        const SizedBox(height: 24),
      ],
    );
  }
}
