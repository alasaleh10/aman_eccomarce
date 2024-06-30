import 'package:flutter/material.dart';

import '../../../../../core/models/items_model.dart';
import '../../../data/models/test_model.dart';
import 'home_items_continer.dart';

class MonthStockListRow extends StatelessWidget {
  final List<ItemsModel> monthStock;

  const MonthStockListRow({super.key, required this.monthStock});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: List.generate(
            testList.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FittedBox(
                child: HomeItemsContiner(
                  itemsModel: monthStock[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
