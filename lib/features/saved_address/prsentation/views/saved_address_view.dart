import 'package:aman_store2/core/api/dio_helper.dart';
import 'package:aman_store2/core/widgets/custom_loading.dart';
import 'package:aman_store2/core/widgets/failure_column.dart';
import 'package:aman_store2/features/saved_address/data/repo/address_repo_im.dart';
import 'package:aman_store2/features/saved_address/prsentation/view_model/my_address_cuibt/my_address_cubit.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import 'widgets/address_add_new_address.dart';
import 'widgets/address_continer.dart';

class SavedAddressView extends StatelessWidget {
  const SavedAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyAddressCubit(AddressRepoIm(dioHelper: DioHelper()))..getAddress(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'mySavedAddress'.tr(),
            style: AppStyle.textStyleSemiBold20,
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(20.h), child: const Divider()),
        ),
        body: Column(
          children: [
            BlocBuilder<MyAddressCubit, MyAddressState>(
              builder: (context, state) {
                if (state is MyAddressFailure) {
                  return Expanded(
                      child: Center(
                          child: FailureColumn(
                              errorMessage: state.message,
                              onPressed: () {
                                BlocProvider.of<MyAddressCubit>(context)
                                    .getAddress();
                              })));
                } else if (state is MyAddressSucess) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.address.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  AddressContiner(
                          address: state.address[index],
                        );
                      },
                    ),
                  );
                } else {
                  return const Expanded(child: CustomLoading());
                }
              },
            ),
            SizedBox(height: 25.h),
             const AddressAddAddress

             (
             
             ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
