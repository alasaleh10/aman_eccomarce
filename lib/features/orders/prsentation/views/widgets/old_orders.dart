import 'package:flutter/material.dart';

import 'order_items.dart';

class OldOrders extends StatelessWidget {
  const OldOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: OrderItems(status: 2));
      },
    );
  }
}
