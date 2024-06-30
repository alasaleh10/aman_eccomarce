import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/functions/show_snac_bar.dart';
import '../../../../../core/routers/app_routers.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/validations/regular_exceptions.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text_form_failed.dart';
import '../../view_model/cheek_email_cuibt/cheek_email_cubit.dart';
import 'auth_loading.dart';

class CheekEmailBodyView extends StatelessWidget {
  const CheekEmailBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<CheekEmailCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: cuibt.key,
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .1),
            Text('cheekEmailPage'.tr(),
                style: AppStyle.textStyleBold25
                    .copyWith(color: AppColors.kBlackColor),
                textAlign: TextAlign.center),
            const SizedBox(height: 15),
            CustomTextFormField(
                validation: (value) {
                  return validations(value: value!, type: 'email');
                },
                image: Assets.imagesEmail,
                title: 'email'.tr(),
                textFormController: cuibt.email),
            const SizedBox(height: 25),
            BlocListener<CheekEmailCubit, CheekEmailState>(
              listener: (context, state) {
                if (state is CheekEmailLoading) {
                  showDialog(
                      context: context,
                      builder: (context) => const AuthLoading());
                } else if (state is CheekEmailFailure) {
                  showSnackBar(context, message: state.errorMessage);
                } else if (state is CheekEmailSucsess) {
                  context.pop();
                  GoRouter.of(context).pushNamed(AppRouters.confirmEmailView,
                      extra: [1, cuibt.email.text]);
                }
              },
              child: CustomElevatedButton(
                  title: 'cheek'.tr(),
                  onPressed: () {
                    cuibt.cheekEmail();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
