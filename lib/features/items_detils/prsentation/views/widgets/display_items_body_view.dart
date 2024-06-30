import 'package:aman_store2/core/widgets/custom_loading.dart';
import 'package:aman_store2/core/widgets/failure_column.dart';
import 'package:aman_store2/features/home/prsentation/views/widgets/home_items_continer.dart';
import 'package:aman_store2/features/items_detils/prsentation/view_model/display_items_cuibt/display_items_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayItemsBodyView extends StatelessWidget {
  final int catId;
  const DisplayItemsBodyView({super.key, required this.catId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayItemsCubit, DisplayItemsState>(
      builder: (context, state) {
        if (state is DisplayItemsFailure) {
          return Center(
              child: FailureColumn(
                  errorMessage: state.message,
                  onPressed: () {
                    BlocProvider.of<DisplayItemsCubit>(context)
                        .getCategorieeItems(catId: catId);
                  }));
        } else if (state is DisplayItemsSucsess) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 2),
            itemCount: state.items.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 288.h,
                child: FittedBox(
                  child: HomeItemsContiner(itemsModel: state.items[index]),
                ),
              );
            },
          );
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}
