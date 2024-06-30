import '../../../../../core/routers/app_routers.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../home_screen/view_model/home_screen_cuibt/home_screen_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';

class DoneRatingContiner extends StatelessWidget {
  const DoneRatingContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        color: AppColors.kPrimColor,
        height: MediaQuery.sizeOf(context).height,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .25),
            Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * .5),
                child: SvgPicture.asset(Assets.imagesStars)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25.h),
              // height: 133,
              // width: 133,
              decoration: const BoxDecoration(
                  color: AppColors.kWhiteColor, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: AppColors.kPrimColor,
                  size: 100.r,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.sizeOf(context).width * .5),
                child: SvgPicture.asset(Assets.imagesStars)),
            SizedBox(height: 40.h),
            Text(
              'thanksForEvaluation'.tr(),
              style: AppStyle.textStyleBold25,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * .05),
              child: CustomElevatedButton(
                textColor: AppColors.kPrimColor,
                backgroundColor: AppColors.kWhiteColor,
                title: 'backHome'.tr(),
                onPressed: () {
                  GoRouter.of(context).goNamed(AppRouters.homeScreenView);
                  BlocProvider.of<HomeScreenCubit>(context)
                      .changePage(index: 0);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
