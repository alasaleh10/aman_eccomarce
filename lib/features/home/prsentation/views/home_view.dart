import 'package:aman_store2/core/functions/display_snackbar.dart';
import 'package:aman_store2/core/widgets/custom_loading.dart';
import 'package:aman_store2/features/home/prsentation/view_model/home_cuibt/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/failure_column.dart';
import 'home_drwer.dart';
import 'widgets/custom_home_appbar.dart';
import 'widgets/home_banner_images.dart';
import 'widgets/home_best_sellier_row.dart';
import 'widgets/home_categorise_text_row.dart';
import 'widgets/home_categorisess_list.dart';
import 'widgets/home_month_stock_row.dart';
import 'widgets/home_new_aman_continer.dart';
import 'widgets/home_search_continer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const HomeDrwer(),
      body: SafeArea(
          child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
            const CustomHomeAppBar(),
            const HomeSearchContiner(),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            BlocConsumer<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is! HomeFailure2 && current is! HomeSucsess2,
              listener: (context, state) {
                if (state is HomeFailure2) {
                  displaySnackBar(context, message: state.message);
                } else if (state is HomeSucsess2) {
                  cuibt.getHomeData(isFromProcess: true);
                }
              },
              builder: (context, state) {
                if (state is HomeFailure) {
                  return SliverFillRemaining(
                    child: FailureColumn(
                      errorMessage: state.message,
                      onPressed: () {
                        cuibt.getHomeData();
                      },
                    ),
                  );
                } else if (state is HomeSucsess) {
                  return SliverFillRemaining(
                    // fillOverscroll: false,
                    child: ListView(
                      // shrinkWrap: true,
                      //  physics: const NeverScrollableScrollPhysics(),
                      children: [
                        HomeBannerImages(
                          banners: state.banners,
                        ),
                        const HomeCategoriseTextRow(),
                        SizedBox(height: 16.h),
                        HomeCategoriseListView(
                          categorisess: state.categorisess,
                        ),
                        const HomeNewAmanContiner(),
                        Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 10),
                            child: Text('bestSelingProducts'.tr(),
                                style: AppStyle.textStyleBold17)),
                        SizedBox(height: 16.h),
                        HomeBestSellerRow(
                          items: state.items,
                        ),
                        SizedBox(height: 20.h),
                        const Divider(
                            color: AppColors.kOtpBorderColor, thickness: 8),
                        SizedBox(height: 16.h),
                        Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 10),
                            child: Text('monthStock'.tr(),
                                style: AppStyle.textStyleBold17)),
                        SizedBox(height: 16.h),
                        MonthStockListRow(
                          monthStock: state.monthStock,
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  );
                } else {
                  return const SliverFillRemaining(child: CustomLoading());
                }
              },
            ),
          ])),
    );
  }
}
