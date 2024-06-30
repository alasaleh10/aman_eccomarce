import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'order_items.dart';

class CurrentOrders extends StatelessWidget {
  const CurrentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: OrderItems(status: 1));
      },
    );
  }
}
