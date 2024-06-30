import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/features/auth/data/repos/auht_repo_im.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/signup_cuibt/sign_up_cubit.dart';
import 'widgets/signup_body_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(AuthRepoIm(dioHelper: DioHelper())),
      child: const Scaffold(
        body: SafeArea(
          child: SignUpBodyView(),
        ),
      ),
    );
  }
}
