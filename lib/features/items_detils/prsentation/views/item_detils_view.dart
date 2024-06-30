import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/utils/app_styles.dart';
import 'package:aman_store2/features/items_detils/data/item_detils_repo_im.dart';
import 'package:aman_store2/features/items_detils/prsentation/view_model/item_detils_cuibt/item_detils_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/item_detils_body_view.dart';

class ItemDetilsView extends StatelessWidget {
  final int itemId;
  const ItemDetilsView({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ItemDetilsCubit(ItemDetilsRepoIm(dioHelper: DioHelper()))
            ..getItemDetils(itemId: itemId),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'detils'.tr(),
            style: AppStyle.textStyleBold22,
          ),
        ),
        body: ItemDetilsBodyView(
          itemId: itemId,
        ),
      ),
    );
  }
}
