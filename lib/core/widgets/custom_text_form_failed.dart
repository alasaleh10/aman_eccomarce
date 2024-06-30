import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final bool isCommed;
  final String? Function(String?)? validation;
  final String? image, hintText;
  final String title;
  final int maxLines;
  final bool obesText;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextEditingController textFormController;

  const CustomTextFormField(
      {super.key,
      this.image,
      required this.title,
      required this.textFormController,
      this.validation,
      this.obesText = false,
      this.textInputType,
      this.isCommed = false,
      this.maxLines = 1,
      this.hintText,
      this.onChanged,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.5),
      child: TextFormField(
        onChanged: onChanged,
        maxLines: maxLines,
        keyboardType: textInputType,
        obscureText: obesText,
        validator: validation,
        controller: textFormController,
        cursorColor: AppColors.kPrimColor,
        decoration: InputDecoration(
            hintText: hintText,
            errorStyle: AppStyle.textStyleRegular14
                .copyWith(color: AppColors.kPrimColor3),
            prefixIconColor: Colors.black,
            prefixIcon: isCommed
                ? null
                : Padding(
                    padding: const EdgeInsetsDirectional.only(start: 19),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          image!,
                        ),
                        const SizedBox(width: 13.5),
                        Text(title, style: AppStyle.textStyleRegular16)
                      ],
                    ),
                  ),
            suffixIcon: suffixIcon,
            focusedErrorBorder: textFormBorder(isCommed: isCommed),
            disabledBorder: textFormBorder(isCommed: isCommed),
            contentPadding: EdgeInsets.symmetric(
                vertical: 10, horizontal: isCommed ? 15 : 0),
            focusedBorder: textFormBorder(isCommed: isCommed),
            errorBorder: textFormBorder(isCommed: isCommed),
            enabledBorder: textFormBorder(isCommed: isCommed)),
      ),
    );
  }

  OutlineInputBorder textFormBorder({bool isCommed = false}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(isCommed ? 10 : 20),
        borderSide: isCommed
            ? const BorderSide(color: AppColors.kOtpBorderColor)
            : const BorderSide());
  }
}
