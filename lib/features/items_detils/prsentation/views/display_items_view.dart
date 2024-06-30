import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/features/items_detils/data/item_detils_repo_im.dart';
import 'package:aman_store2/features/items_detils/prsentation/view_model/display_items_cuibt/display_items_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/display_items_body_view.dart';

class DisplayItemsView extends StatelessWidget {
  final List data;
  const DisplayItemsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DisplayItemsCubit(ItemDetilsRepoIm(dioHelper: DioHelper()))
            ..getCategorieeItems(catId: data[0]),
      child: Scaffold(
        appBar: AppBar(
          title: Text(data[1]),
        ),
        body: DisplayItemsBodyView(
          catId: data[0],
        ),
      ),
    );
  }
}
