import 'package:aman_store2/core/functions/display_snackbar.dart';
import 'package:aman_store2/features/items_detils/prsentation/view_model/item_detils_cuibt/item_detils_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';

class AddItemToCart extends StatelessWidget {
  final bool isCart;
  final int id;
  const AddItemToCart({super.key, required this.isCart, required this.id});

 

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemDetilsCubit, ItemDetilsState>(
      listener: (context, state) {
       
        if (state is ItemDetilsFailure2) {
          displaySnackBar(context, message: state.message);
        } else if (state is ItemDetilsSucsess2) {
          BlocProvider.of<ItemDetilsCubit>(context)
              .getItemDetils(itemId: id, isFromProcess: true);
        }
      },
      child: CustomElevatedButton(
          title: isCart ? 'deleteCart'.tr() : 'addToCart'.tr(),
          onPressed: () {
            BlocProvider.of<ItemDetilsCubit>(context)
                .addORdeleteCart(itemId: id);
          }),
    );
  }
}
