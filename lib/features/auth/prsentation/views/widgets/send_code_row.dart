import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../view_model/confirm_email_cuibt/confirm_email_cubit.dart';

class SendCodeRow extends StatelessWidget {
  const SendCodeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<ConfirmEmailCubit, ConfirmEmailState>(
        builder: (context, state) {
          return context.read<ConfirmEmailCubit>().secondsRemaining == 0
              ? GestureDetector(
                  onTap: () {
                    context.read<ConfirmEmailCubit>().startTimer();
                  },
                  child: Text('sendAgain'.tr(),
                      style: AppStyle.textStyleRegular14))
              : Text(
                  '${'sendCodeAgain'.tr()} ${context.read<ConfirmEmailCubit>().secondsRemaining} ${'second'.tr()}',
                  style: AppStyle.textStyleRegular14,
                );
        },
      ),
    );
  }
}
