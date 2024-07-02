import 'package:aman_store2/core/widgets/custom_loading.dart';
import 'package:aman_store2/core/widgets/failure_column.dart';
import 'package:aman_store2/features/my_account/prsentation/view_model/account_cuibt/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home_screen/view_model/home_screen_cuibt/home_screen_cubit.dart';
import 'widgets/account_detils_row.dart';
import 'widgets/account_list_tile_column.dart';
import 'widgets/account_top_row_continers.dart';
import 'widgets/edit_account_continer.dart';

class MyAccountHome extends StatelessWidget {
  const MyAccountHome({super.key});

  @override
  Widget build(BuildContext context) {
   
    
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                BlocProvider.of<HomeScreenCubit>(context).goLastPage();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            if (state is AccountFailure) {
              return Center(
                child: FailureColumn(
                    errorMessage: state.message,
                    onPressed: () {
                      BlocProvider.of<AccountCubit>(context).getProfile();
                    }),
              );
            } else if (state is AccountSucess) {
              return ListView(
                children: [
                  const Divider(color: AppColors.kOtpBorderColor),
                  AccountDetilsRow(
                    userData: state.userData,
                  ),
                  const EditAccountContiner(),
                  const SizedBox(height: 24),
                  AccountRowContiners(
                    userData: state.userData,
                  ),
                  const AccountListTileColumn()
                ],
              );
            } else {
              return const CustomLoading();
            }
          },
        ));
  }
  
}
//
