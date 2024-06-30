import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/confirm_email_cuibt/confirm_email_cubit.dart';
import 'custom_otp_filed.dart';

class CustomTextFailedOtp extends StatelessWidget {
  const CustomTextFailedOtp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = BlocProvider.of<ConfirmEmailCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomOtpFaild(
          controller: controller.t1,
        ),
        CustomOtpFaild(
          controller: controller.t2,
        ),
        CustomOtpFaild(
          controller: controller.t3,
        ),
        CustomOtpFaild(
          controller: controller.t4,
        )
      ],
    );
  }
}
