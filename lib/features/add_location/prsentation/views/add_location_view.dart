import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/add_location_cuibt/add_location_cubit.dart';
import 'widgets/add_location_body_view.dart';

class AddLocationView extends StatelessWidget {
  const AddLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddLocationCubit()..getCurrentLocation(),
      child: const Scaffold(
        body: SafeArea(
          child: AddLocationBodyView(),
        ),
      ),
    );
  }
}
