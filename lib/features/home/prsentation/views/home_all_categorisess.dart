import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/widgets/custom_loading.dart';
import 'package:aman_store2/core/widgets/failure_column.dart';
import 'package:aman_store2/features/home/data/repos/home_repo_im.dart';
import 'package:aman_store2/features/home/prsentation/view_model/get_all_categoriees/all_categorisess_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_styles.dart';

import 'widgets/home_categorie_item.dart';

class HomeAllCategorisess extends StatelessWidget {
  const HomeAllCategorisess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllCategorisessCubit(HomeRepoIm(dioHelper: DioHelper()))
            ..getAllCategorisee(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'categorises'.tr(),
            style: AppStyle.textStyleSemiBold20,
          ),
        ),
        body: SafeArea(
            child: BlocBuilder<AllCategorisessCubit, AllCategorisessState>(
          builder: (context, state) {
            if (state is AllCategorisessFailure) {
              return Center(
                child: FailureColumn(
                    errorMessage: state.message,
                    onPressed: () {
                      BlocProvider.of<AllCategorisessCubit>(context)
                          .getAllCategorisee();
                    }),
              );
            } else if (state is AllCategorisessSucsess) {
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  const SliverToBoxAdapter(
                    child: Divider(),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 15)),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    sliver: SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            // 3,
                            MediaQuery.sizeOf(context).width > 550 ? 4 : 3,
                        // mainAxisSpacing: 30.h,
                        // crossAxisSpacing: 14,
                      ),
                      itemBuilder: (context, index) {
                        return CategorieItem(
                          categorieeModel: state.categorisess[index],
                        );
                      },
                      itemCount: state.categorisess.length,
                    ),
                  )
                ],
              );
            } else {
              return const CustomLoading();
            }
          },
        )),
      ),
    );
  }
}
