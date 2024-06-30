import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../view_model/home_screen_cuibt/home_screen_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cuibt = BlocProvider.of<HomeScreenCubit>(context);

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.kPrimColor.withOpacity(.2),
          spreadRadius: 1,
          blurRadius: 8,
          offset: const Offset(0, 0),
        ),
      ]),
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cuibt.index,
            selectedItemColor: AppColors.kPrimColor,
            elevation: 0,
            selectedLabelStyle: AppStyle.textStyleRegular16,
            unselectedLabelStyle: AppStyle.textStyleRegular14,
            onTap: (index) {
              if (cuibt.index == index) return;
              cuibt.changePage(index: index);
            },
            items: [
              BottomNavigationBarItem(
                  label: 'home'.tr(),
                  icon: SvgPicture.asset(
                    Assets.imagesHome,
                    colorFilter: ColorFilter.mode(
                        cuibt.index == 0 ? AppColors.kPrimColor : Colors.black,
                        BlendMode.srcIn),

                    // width: 16,
                    // height: 22,
                  )),
              BottomNavigationBarItem(
                  label: 'offers'.tr(),
                  icon: SvgPicture.asset(
                    Assets.imagesOffers,

                    colorFilter: ColorFilter.mode(
                        cuibt.index == 1 ? AppColors.kPrimColor : Colors.black,
                        BlendMode.srcIn),
                    // width: 16,
                    // height: 22,
                  )),
              BottomNavigationBarItem(
                  label: 'cart'.tr(),
                  icon: SvgPicture.asset(
                    Assets.imagesCart,
                    colorFilter: ColorFilter.mode(
                        cuibt.index == 2 ? AppColors.kPrimColor : Colors.black,
                        BlendMode.srcIn),
                  )),
              BottomNavigationBarItem(
                  label: 'myorders'.tr(),
                  icon: SvgPicture.asset(
                    Assets.imagesOrders,
                    colorFilter: ColorFilter.mode(
                        cuibt.index == 3 ? AppColors.kPrimColor : Colors.black,
                        BlendMode.srcIn),
                  )),
              BottomNavigationBarItem(
                  label: 'myAccount'.tr(),
                  icon: SvgPicture.asset(
                    Assets.imagesAccount,
                    colorFilter: ColorFilter.mode(
                        cuibt.index == 4 ? AppColors.kPrimColor : Colors.black,
                        BlendMode.srcIn),
                  )),
            ],
          );
        },
      ),
    );
  }
}
