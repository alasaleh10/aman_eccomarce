import 'package:aman_store2/core/functions/display_snackbar.dart';
import 'package:aman_store2/features/favorite/prsentation/view_model/cubit/faviort_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../items_detils/prsentation/views/widgets/item_detils_icon_continer.dart';

class FaviorteRmove extends StatelessWidget {
  final int itemId;
  const FaviorteRmove({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FaviortCubit, FaviortState>(
      listener: (context, state) {
        if (state is FaviortMessage) {
          displaySnackBar(context, message: state.message, isError: false);
        } else if (state is FaviortSucsess2) {
          BlocProvider.of<FaviortCubit>(context).getFaviort(isFromadding: true);
        }
      },
      child: Positioned(
          // top: 0,
          left: isArabick(context) ? 8.w : null,
          right: isArabick(context) ? null : 8.w,
          child: CustomContinerIcon(
            icon: Icons.favorite,
            iconColor: AppColors.kPrimColor,
            onTap: () {
              BlocProvider.of<FaviortCubit>(context)
                  .deleteFaviort(itemId: itemId);
              // cuibt.addORdeleteFaviore(context, itemId: itemId);
            },
          )),
    );
  }
}
