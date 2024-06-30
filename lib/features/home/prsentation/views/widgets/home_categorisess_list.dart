import 'package:flutter/material.dart';

import '../../../../../core/models/categoriee_model.dart';

import 'home_categorie_item.dart';

class HomeCategoriseListView extends StatelessWidget {
  final List<CategorieeModel> categorisess;
  const HomeCategoriseListView({super.key, required this.categorisess});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              categorisess.length,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.5),
                    child: CategorieItem(categorieeModel: categorisess[index]),
                  )),
        ),
      ),
    );
  }
}
