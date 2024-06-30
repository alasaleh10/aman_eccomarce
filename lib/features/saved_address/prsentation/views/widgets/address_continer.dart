import 'package:aman_store2/core/helper/cached_helper.dart';
import 'package:aman_store2/core/utils/app_colors.dart';
import 'package:aman_store2/core/utils/app_styles.dart';
import 'package:aman_store2/features/saved_address/data/model/address_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressContiner extends StatefulWidget {
  final AddressModel address;
  const AddressContiner({super.key, required this.address});

  @override
  State<AddressContiner> createState() => _AddressContinerState();
}

class _AddressContinerState extends State<AddressContiner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kOtpBorderColor),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              activeColor: AppColors.kPrimColor,
              value: widget.address.id!.toInt(),
              groupValue: CacheHelper.getData(key: 'addressId'),
              onChanged: (value) {
                CacheHelper.saveData(key: 'addressId', value: value);
                setState(() {});
              },
              title: Text(
                'setAsDefualtAddress'.tr(),
                style: AppStyle.textStyleRegular14,
              ),
              secondary: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.kOtpBorderColor)),
                  child: Icon(
                    Icons.edit_outlined,
                    size: 23.r,
                    color: AppColors.kPrimColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.address.name!,
                style: AppStyle.textStyleRegular16
                    .copyWith(color: AppColors.kBlackColor),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                  '${widget.address.city} - ${widget.address.region} - ${widget.address.details}',
                  style: AppStyle.textStyleRegular14
                      .copyWith(fontWeight: FontWeight.w400)
                  //  Styls.textStyl12,
                  ),
            ),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
