import '../../../../../core/routers/app_routers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class FlolowRating extends StatelessWidget {
  const FlolowRating({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ListTile(
            title: Text(
              'weHappyTodealing'.tr(),
              style: AppStyle.textStyleRegular14.copyWith(
                  color: const Color(0xff45495E), fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              'weWouldKnowEvaluation'.tr(),
              style: AppStyle.textStyleRegular14
                  .copyWith(color: const Color(0xff45495E)),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * .05),
            child: CustomElevatedButton(
                radius: 20,
                title: 'evaluationExprence'.tr(),
                onPressed: () {
                  GoRouter.of(context)
                      .pushNamed(AppRouters.ratingOrderTryingView);
                }),
          ),
        ],
      ),
    );
  }
}
