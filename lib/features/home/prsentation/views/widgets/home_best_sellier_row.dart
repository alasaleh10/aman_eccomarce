import 'package:aman_store2/core/models/items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_items_continer.dart';

class HomeBestSellerRow extends StatelessWidget {
  final List<ItemsModel> items;
  const HomeBestSellerRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
            children: List.generate(
                items.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: FittedBox(
                        child: HomeItemsContiner(
                          itemsModel: items[index],
                        ),
                      ),
                    ))),
      ),
    );
  }
}
