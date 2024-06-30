import 'package:flutter/material.dart';

class FollowOrdersItems extends StatelessWidget {
  const FollowOrdersItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      // physics: const NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
            padding: EdgeInsets.symmetric(vertical: 5), child: Text('')
            //  HomeSearchItem(
            //   isOrder: true,
            // ),
            );
      },
    );
  }
}
