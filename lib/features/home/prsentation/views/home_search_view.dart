import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/utils/app_colors.dart';
import 'package:aman_store2/core/widgets/custom_loading.dart';
import 'package:aman_store2/core/widgets/failure_column.dart';
import 'package:aman_store2/features/home/data/repos/home_repo_im.dart';
import 'package:aman_store2/features/home/prsentation/view_model/home_cuibt/search_items_cuibt/search_item_cubit.dart';
import 'package:aman_store2/features/home/prsentation/views/widgets/search_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../home_screen/view_model/home_screen_cuibt/home_screen_cubit.dart';
import 'widgets/home_search_item.dart';

class HomeSearchView extends StatelessWidget {
  const HomeSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchItemCubit(HomeRepoIm(dioHelper: DioHelper())),
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          BlocProvider.of<HomeScreenCubit>(context)
              .changeSearchOrHome(isSearch: false);
        },
        child: Scaffold(
          body: SafeArea(
              child: CustomScrollView(
            slivers: [
              const SearchRow(),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('searchResult'.tr(),
                      style: AppStyle.textStyleRegular16),
                ),
              ),
              BlocBuilder<SearchItemCubit, SearchItemState>(
                builder: (context, state) {
                  if (state is SearchItemILoading) {
                    return const SliverFillRemaining(child: CustomLoading());
                  } else if (state is SearchItemFailure) {
                    return SliverFillRemaining(
                      child: FailureColumn(
                          errorMessage: state.message,
                          onPressed: () {
                            BlocProvider.of<SearchItemCubit>(context)
                                .searchItem();
                          }),
                    );
                  } else if (state is SearchItemSucsess) {
                    return SliverList.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: HomeSearchItem(
                            itemsModel: state.items[index],
                          ),
                        );
                      },
                      itemCount: state.items.length,
                    );
                  } else {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'searchWhatNeed'.tr(),
                          style: AppStyle.textStyleSemiBold20
                              .copyWith(color: AppColors.kPrimColor),
                        ),
                      ),
                    );
                  }
                },
              ),
              SliverToBoxAdapter(child: SizedBox(height: 15.h))
            ],
          )),
        ),
      ),
    );
  }
}
// refactor Code && complate Search
// 2024/5/12
