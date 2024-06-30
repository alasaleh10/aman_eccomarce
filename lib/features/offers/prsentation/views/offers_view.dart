import 'package:flutter/material.dart';

import 'widgets/offers_app_bar.dart';
import 'widgets/offers_items.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const OffersAppBar(),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            const SliverToBoxAdapter(child: Divider()),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              sliver: SliverGrid.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio:
                        MediaQuery.sizeOf(context).width > 550 ? 1 : 1 / 1.4,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 20,
                    crossAxisCount:
                        MediaQuery.sizeOf(context).width > 550 ? 4 : 2),
                itemBuilder: (context, index) {
                  return const OffersItems();
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 15))
          ],
        ),
      ),
    );
  }
}
