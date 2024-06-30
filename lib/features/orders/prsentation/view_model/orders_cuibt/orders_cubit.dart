import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  PageController pageController = PageController();
  int index = 0;
  void changepage({required int index}) {
    this.index = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.bounceIn);
  }
}
