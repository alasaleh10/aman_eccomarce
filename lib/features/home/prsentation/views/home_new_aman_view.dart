import 'widgets/home_new_aman_appbar.dart';
import 'widgets/new_aman_items.dart';
import 'package:flutter/material.dart';
import 'widgets/new_aman_home_view_continer.dart';

class HomeNewAmanView extends StatelessWidget {
  const HomeNewAmanView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeNewAmanAppBar(),
            SliverToBoxAdapter(child: Divider()),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            NewAmanViewContiner(),
            SliverToBoxAdapter(child: SizedBox(height: 15)),
            NewAmanItems(),
            SliverToBoxAdapter(child: SizedBox(height: 15)),
          ],
        ),
      ),
    );
  }
}
