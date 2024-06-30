import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/cheek_email_cuibt/cheek_email_cubit.dart';
import 'widgets/cheek_email_body_view.dart';

class CheekEmailView extends StatelessWidget {
  const CheekEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheekEmailCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const CheekEmailBodyView(),
      ),
    );
  }
}
