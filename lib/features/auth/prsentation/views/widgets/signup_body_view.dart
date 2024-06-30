import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/functions/show_snac_bar.dart';
import '../../../../../core/routers/app_routers.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../view_model/signup_cuibt/sign_up_cubit.dart';
import 'auth_loading.dart';
import 'row_account_auth.dart';
import 'sign_up_auth_filds.dart';

class SignUpBodyView extends StatelessWidget {
  const SignUpBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<SignUpCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Form(
        key: cuibt.key,
        child: ListView(
          children: [
            Image.asset(
              Assets.imagesLogo,
              height: 100.h,
            ),
            Text(
              'signup1'.tr(),
              style: AppStyle.textStyleBold22,
            ),
            SizedBox(height: 17.h),
            SignUpAuthFilds(cuibt: cuibt),
            SizedBox(height: 17.h),
            BlocListener<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpLoading) {
                  showDialog(
                      context: context,
                      builder: (context) => const AuthLoading());
                } else if (state is SignUpSucsess) {
                  context.pop();
                  context.goNamed(
                    AppRouters.homeScreenView,
                  );
                } else if (state is SignUpFailure) {
                  context.pop();
                  Navigator.pop(context);
                  showSnackBar(context, message: state.errorMessage);
                }
              },
              child: CustomElevatedButton(
                  title: 'signup2'.tr(),
                  onPressed: () {
                    cuibt.cheekData();
                  }),
            ),
            SizedBox(height: 17.h.h),
            RowAccountAuth(
                title1: 'haveaccount1'.tr(),
                title2: 'login'.tr(),
                onPressed: () {
                  GoRouter.of(context).pop();
                }),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
