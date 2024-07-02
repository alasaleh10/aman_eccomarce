import 'package:aman_store2/core/constins/const.dart';
import 'package:aman_store2/features/auth/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_styles.dart';
import 'account_image_stack.dart';

class AccountDetilsRow extends StatelessWidget {
  final LoginModel userData;
  const AccountDetilsRow({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          AccountImageStack(image: erroeImage, onTap: () {}),
          SizedBox(width: 20.w),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userData.name!,
                style: AppStyle.textStyleSemiBold20,
              ),
              Text(
                userData.email!,
                style: AppStyle.textStyleRegular16
                    .copyWith(color: const Color(0xffCACACA)),
              )
            ],
          ))
        ],
      ),
    );
  }
}
