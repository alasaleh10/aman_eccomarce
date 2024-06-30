import 'package:aman_store2/core/functions/display_snackbar.dart';
import 'package:aman_store2/features/home/prsentation/view_model/home_cuibt/search_items_cuibt/search_item_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_text_form_failed.dart';
import '../../../../home_screen/view_model/home_screen_cuibt/home_screen_cubit.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<SearchItemCubit>(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          children: [
            Expanded(
                child: CustomTextFormField(
              onChanged: (val) {
                if (val.trim().isEmpty) {
                  cuibt.clearData();
                }
              },
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: AppColors.kPrimColor,
                ),
                onPressed: () {
                  if (cuibt.text.text.trim().isEmpty) {
                    displaySnackBar(context, message: 'لايمكن يكون فارغا');
                  } else {
                    cuibt.searchItem();
                  }
                },
              ),
              hintText: 'whatyouloking'.tr(),
              image: Assets.imagesSearchIcon,
              textFormController: cuibt.text,
              title: '',
            )),
            SizedBox(
              width: 15.w,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<HomeScreenCubit>(context)
                    .changeSearchOrHome(isSearch: false);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'cancel'.tr(),
                    style: AppStyle.textStyleBold18
                        .copyWith(color: AppColors.kPrimColor3),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.cancel_outlined,
                    color: AppColors.kPrimColor3,
                    size: 25,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
