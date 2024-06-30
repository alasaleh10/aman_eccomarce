import 'package:aman_store2/core/widgets/custom_loading.dart';
import 'package:aman_store2/core/widgets/failure_column.dart';
import 'package:aman_store2/features/favorite/prsentation/view_model/cubit/faviort_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'faviort_items.dart';

class FaviortBodyView extends StatelessWidget {
  const FaviortBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaviortCubit, FaviortState>(
      buildWhen: (previous, current) =>
          current is! FaviortMessage && current is! FaviortSucsess2,
      builder: (context, state) {
        if (state is FaviortFailure) {
          return Center(
              child: FailureColumn(
                  errorMessage: state.message,
                  onPressed: () {
                    BlocProvider.of<FaviortCubit>(context).getFaviort();
                  }));
        } else if (state is FaviortSucess) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                child: FaviorteItems(
                  items: state.items[index],
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
