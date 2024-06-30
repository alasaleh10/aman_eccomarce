import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_helper.dart';
import '../../data/repo/faviort_repo_im.dart';
import '../view_model/cubit/faviort_cubit.dart';
import 'widgets/faviort_body_view.dart';

class FaviortView extends StatelessWidget {
  const FaviortView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaviortCubit(
        FaviorteRepoIm(dioHelper: DioHelper()),
      )..getFaviort(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('faviorte'.tr()),
        ),
        body: const FaviortBodyView(),
      ),
    );
  }
}
