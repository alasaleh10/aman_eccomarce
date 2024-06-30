import 'package:flutter/cupertino.dart';

import '../../../data/models/test_model.dart';


class NewAmanItems extends StatelessWidget {
  const NewAmanItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        sliver: SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15,
              // mainAxisExtent: 20,
              crossAxisSpacing: 25,
              childAspectRatio: 1 / 1.6,
              crossAxisCount: MediaQuery.sizeOf(context).width > 550 ? 3 : 2),
          itemBuilder: (context, index) {
            return FittedBox(fit: BoxFit.cover, child: Text('')
                // HomeItemsContiner(
                //   testModel: testList[index],
                // ),
                );
          },
          itemCount: testList.length,
        ));
  }
}
