import '../../view_model/rating_trying_cuibt/rating_trying_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feadback_rating_continer.dart';

class FeadBackColumn extends StatelessWidget {
  const FeadBackColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingTryingCubit, RatingTryingState>(
      builder: (context, state) {
        final cuibt = BlocProvider.of<RatingTryingCubit>(context);

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FeadBackRatingContiner(
                  isActive: cuibt.index2 == 0,
                  onTap: () {
                    cuibt.chnageRatingFeadback(index2: 0);
                  },
                  title: 'distinctiveProducts'.tr(),
                ),
                SizedBox(width: 20.w),
                FeadBackRatingContiner(
                  horizontal: 20.w,
                  // vertical:,
                  isActive: cuibt.index2 == 1,
                  onTap: () {
                    cuibt.chnageRatingFeadback(index2: 1);
                  },
                  title: 'fastDelivery'.tr(),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                const Spacer(),
                FeadBackRatingContiner(
                  horizontal: 20.w,
                  // vertical:,
                  isActive: cuibt.index2 == 2,
                  onTap: () {
                    cuibt.chnageRatingFeadback(index2: 2);
                  },
                  title: 'cheapPrices'.tr(),
                ),
                const Spacer()
              ],
            ),
          ],
        );
      },
    );
  }
}
