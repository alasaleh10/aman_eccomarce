import 'package:aman_store2/core/routers/app_routers.dart';
import 'package:aman_store2/features/saved_address/prsentation/view_model/my_address_cuibt/my_address_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class AddressAddAddress extends StatelessWidget {
  const AddressAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * .05),
      child: BlocBuilder<MyAddressCubit, MyAddressState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              context
                  .pushNamed(AppRouters.addAddressView, extra: [context, 0, 0]);
            },
            child: DottedBorder(
              color: AppColors.kPrimColor,
              radius: const Radius.circular(30),
              dashPattern: const [20, 12],
              strokeWidth: 1,
              borderType: BorderType.RRect,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                // height: 51,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffFEF1E5),
                  borderRadius: BorderRadius.circular(30),
                  // border: Border.all(color: kPrimColor)
                ),
                child: Center(
                    child: Text('addNewAddress'.tr(),
                        style: AppStyle.textStyleRegular14
                            .copyWith(color: AppColors.kPrimColor)
                        //  Styls.textStyl14.copyWith(color: kPrimColor),
                        )),
              ),
            ),
          );
        },
      ),
    );
  }
}
