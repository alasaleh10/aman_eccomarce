import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text_form_failed.dart';
import 'done_rating_continer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'feadback_column.dart';
import 'rating_faces_listile.dart';

class RatingOrderTryingBodyView extends StatelessWidget {
  const RatingOrderTryingBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ListView(
        children: [
          ListTile(
            title: Text(
              'weHappyTodealing'.tr(),
              style: AppStyle.textStyleSemiBold23.copyWith(
                  color: const Color(0xff45495E), fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              'weWouldKnowEvaluation'.tr(),
              style: AppStyle.textStyleBold18
                  .copyWith(color: const Color(0xff45495E)),
              textAlign: TextAlign.center,
            ),
          ),
          const RatingFacesListTile(),
          SizedBox(height: 10.h),
          const FeadBackColumn(),
          SizedBox(height: 10.h),
          Text(
            'doYouHaveComment'.tr(),
            style: AppStyle.textStyleBold25.copyWith(
                color: const Color(0xff8B959E), fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
              maxLines: 4,
              isCommed: true,
              title: '',
              textFormController: TextEditingController()),
          SizedBox(height: 70.h),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: MediaQuery.sizeOf(context).width * .05),
            child: CustomElevatedButton(
              title: 'send'.tr(),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => const DoneRatingContiner());
              },
            ),
          )
        ],
      ),
    );
  }
}
