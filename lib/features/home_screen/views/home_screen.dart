import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/features/cart/data/repo/cart_repo_im.dart';
import 'package:aman_store2/features/cart/prsentation/view_model/p_cart_cuibt/p_cart_cubit.dart';
import 'package:aman_store2/features/home/data/repos/home_repo_im.dart';
import 'package:aman_store2/features/home/prsentation/view_model/home_cuibt/home_cubit.dart';
import 'package:aman_store2/features/material_aman/cubit/material_cubit.dart';
import 'package:aman_store2/features/my_account/data/account_repo_im.dart';
import 'package:aman_store2/features/my_account/prsentation/view_model/account_cuibt/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../orders/prsentation/view_model/orders_cuibt/orders_cubit.dart';
import '../view_model/home_screen_cuibt/home_screen_cubit.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HomeCubit(HomeRepoIm(dioHelper: DioHelper()))..getHomeData(),
          ),
          BlocProvider(
              create: (context) =>
                  AccountCubit(AccountRepoIm(dioHelper: DioHelper()))
                    ..getProfile()),
          BlocProvider(
              create: (context) =>
                  PCartCubit(CartRepoIm(dio: DioHelper()))..getCart(context)),
          BlocProvider(create: (context) => OrdersCubit())
        ],
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            final cuibt = BlocProvider.of<HomeScreenCubit>(context);
            return BlocBuilder<MaterialCubit, MaterialStates>(
              builder: (context, state) {
                return Scaffold(
                    bottomNavigationBar: const CustomBottomNavigationBar(),
                    body: cuibt.pages().elementAt(cuibt.index));
              },
            );
          },
        ));
  }
}
