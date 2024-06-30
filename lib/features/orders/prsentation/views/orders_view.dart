import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_screen/view_model/home_screen_cuibt/home_screen_cubit.dart';
import 'widgets/orders_body_view.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<HomeScreenCubit>(context).goLastPage();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: const OrdersBodyView(),
    );
  }
}
