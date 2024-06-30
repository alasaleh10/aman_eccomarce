import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/prsentation/views/cart_view.dart';
import '../../../home/prsentation/views/home_search_view.dart';
import '../../../home/prsentation/views/home_view.dart';
import '../../../my_account/prsentation/views/my_account_home.dart';
import '../../../offers/prsentation/views/offers_view.dart';
import '../../../orders/prsentation/views/orders_view.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  int index = 0;
  int? oldIndex;
  bool isSearch = false;

  void changeSearchOrHome({required bool isSearch}) {
    this.isSearch = isSearch;
    emit(HomeScreenInitial());
  }

  List<Widget> pages() {
    if (isSearch) {
      return const [
        HomeSearchView(),
        OffersView(),
        CartView(),
        OrdersView(),
        MyAccountHome()
      ];
    } else {
      return const [
        HomeView(),
        OffersView(),
        CartView(),
        OrdersView(),
        MyAccountHome()
      ];
    }
  }

  void goLastPage() {
    if (index == oldIndex) {
      index = 0;
    } else {
      index = oldIndex!;
    }

    emit(HomeScreenInitial());
  }

  void changePage({required int index}) {
    oldIndex = this.index;
    this.index = index;
    emit(HomeScreenInitial());
  }
}
