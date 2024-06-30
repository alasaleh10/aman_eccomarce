import 'package:aman_store2/features/cart/prsentation/view_model/p_cart_cuibt/p_cart_cubit.dart';
import 'package:aman_store2/features/home/prsentation/view_model/home_cuibt/home_cubit.dart';
import 'package:aman_store2/features/material_aman/cubit/material_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../home_screen/view_model/home_screen_cuibt/home_screen_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'widgets/drwer_image.dart';
import 'widgets/home_drwer_list_tile.dart';

class HomeDrwer extends StatelessWidget {
  const HomeDrwer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.kPrimColor,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(children: [
          ListView(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        Scaffold.of(context).closeDrawer();
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                        size: 30,
                        color: Colors.white,
                      )),
                  Image.asset(
                    Assets.imagesLogo1,
                    height: 50,
                  )
                ],
              ),
              DrwerListTile(
                title: 'home'.tr(),
                image: Assets.imagesHome,
                onTap: () {
                  closeDrwer(context, 0);
                },
              ),
              DrwerListTile(
                  image: Assets.imagesOffers,
                  title: 'offers'.tr(),
                  onTap: () {
                    closeDrwer(context, 1);
                  }),
              Stack(
                children: [
                  DrwerListTile(
                      image: Assets.imagesCart,
                      title: 'cart'.tr(),
                      onTap: () {
                        closeDrwer(context, 2);
                      }),
                  Positioned(
                      right: 3,
                      child: CircleAvatar(
                        backgroundColor: AppColors.kPrimColor2,
                        radius: 12,
                        child: Text(
                          '2',
                          style: AppStyle.textStyleRegular14
                              .copyWith(color: AppColors.kWhiteColor),
                        ),
                      ))
                ],
              ),
              DrwerListTile(
                  image: Assets.imagesAccount,
                  title: 'myAccount'.tr(),
                  onTap: () {
                    closeDrwer(context, 4);
                  }),
              DrwerListTile(
                  image: Assets.imagesAbout, title: 'about'.tr(), onTap: () {}),
              DrwerListTile(
                  image: Assets.imagesTerms, title: 'terms'.tr(), onTap: () {}),
              DrwerListTile(
                  image: Assets.imagesShare, title: 'share'.tr(), onTap: () {}),
              DrwerListTile(
                  image: Assets.imagesLanguage,
                  title: 'changeLan'.tr(),
                  onTap: () {
                    BlocProvider.of<MaterialCubit>(context)
                        .changeLange(context);
                    BlocProvider.of<HomeScreenCubit>(context)
                        .changePage(index: 0);
                    BlocProvider.of<HomeCubit>(context)
                        .getHomeData(isFromProcess: true);
                    BlocProvider.of<PCartCubit>(context).getCart(context);
                    context.pop();
                  })
            ],
          ),
          const DrwerImage()
        ]),
      ),
    );
  }

  void closeDrwer(BuildContext context, int index) {
    Scaffold.of(context).closeDrawer();
    BlocProvider.of<HomeScreenCubit>(context).changePage(index: index);
  }
}
