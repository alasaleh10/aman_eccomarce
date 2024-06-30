import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/functions/show_snac_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/validations/regular_exceptions.dart';

class CustomOtpFaild extends StatelessWidget {
  final TextEditingController controller;

  const CustomOtpFaild({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(color: kPrimColor),
          borderRadius: BorderRadius.circular(90),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              spreadRadius: -2,
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ]),
      height: 72,
      width: 72,
      child: TextField(
        controller: controller,
        showCursor: true,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        maxLength: 1,
        cursorColor: AppColors.kBlackColor,
        // cursorHeight: 30,
        cursorWidth: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: outlineBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(160)),
          counterText: '',
        ),
        onChanged: (value) {
          if (!RegExp(RegularExceptions.phoneReg).hasMatch(value)) {
            showSnackBar(context, message: 'mustbeInt'.tr());
            return;
          } else {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.kOtpBorderColor),
        borderRadius: BorderRadius.circular(160));
  }
}
