import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/validations/regular_exceptions.dart';
import '../../../../../core/widgets/custom_text_form_failed.dart';
import '../../view_model/signup_cuibt/sign_up_cubit.dart';

class SignUpAuthFilds extends StatelessWidget {
  final SignUpCubit cuibt;
  const SignUpAuthFilds({super.key, required this.cuibt});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 9.h),
        CustomTextFormField(
          validation: (value) {
            return validations(value: value!, type: 'name');
          },
          image: Assets.imagesUsername,
          textFormController: cuibt.name2,
          title: 'name2'.tr(),
        ),
        const SizedBox(height: 9),
        CustomTextFormField(
          validation: (value) {
            return validations(value: value!, type: 'email');
          },
          image: Assets.imagesEmail,
          textFormController: cuibt.email,
          title: 'email'.tr(),
        ),
        const SizedBox(height: 9),
        CustomTextFormField(
          textInputType: TextInputType.phone,
          validation: (value) {
            return validations(value: value!, type: 'phone');
          },
          image: Assets.imagesPhone,
          textFormController: cuibt.phone,
          title: 'phone'.tr(),
        ),
        const SizedBox(height: 9),
        CustomTextFormField(
          textInputType: TextInputType.visiblePassword,
          obesText: true,
          validation: (value) {
            return validations(value: value!, type: 'password');
          },
          image: Assets.imagesLuck,
          textFormController: cuibt.password1,
          title: 'password'.tr(),
        ),
        const SizedBox(height: 9),
        CustomTextFormField(
          textInputType: TextInputType.visiblePassword,
          obesText: true,
          validation: (value) {
            return validations(
                value: value!,
                type: 'password',
                password2: cuibt.password2.text,
                password1: cuibt.password1.text);
          },
          image: Assets.imagesLuck,
          textFormController: cuibt.password2,
          title: 'confirmpassword'.tr(),
        ),
      ],
    );
  }
}
