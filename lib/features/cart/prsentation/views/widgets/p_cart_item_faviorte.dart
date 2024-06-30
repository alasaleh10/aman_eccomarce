import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/display_snackbar.dart';
import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../items_detils/prsentation/views/widgets/item_detils_icon_continer.dart';
import '../../view_model/p_cart_cuibt/p_cart_cubit.dart';

class PCartItemFaviore extends StatelessWidget {
  final int itemId;
  final bool isFav;

  const PCartItemFaviore({
    super.key,
    required this.itemId,
    required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<PCartCubit>(context);
    return BlocListener<PCartCubit, PCartState>(
        listener: (context, state) {
          if (state is PCartMessage) {
            displaySnackBar(context, message: state.message, isError: false);
          } else if (state is PCartSucsess2) {
            cuibt.getCart(context, isFromProcess: true);
          }
        },
        child: Positioned(
            // top: 0,
            left: isArabick(context) ? 8.w : null,
            right: isArabick(context) ? null : 8.w,
            child: CustomContinerIcon(
              icon: isFav ? Icons.favorite : Icons.favorite_border,
              iconColor: AppColors.kPrimColor,
              onTap: () {
                cuibt.addORdeleteFaviore(context, itemId: itemId);
              },
            )));
  }
}
