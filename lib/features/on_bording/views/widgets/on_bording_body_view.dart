import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import '../../data/on_bording_list_items.dart';
import '../../view_model/on_bording_cuibt/on_bording_cubit.dart';
import 'on_bording_indecator.dart';
import 'skip_text.dart';

class OnBordingBodyView extends StatelessWidget {
  const OnBordingBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: BlocProvider.of<OnBordingCubit>(context).pageController,
      onPageChanged: (value) {
        BlocProvider.of<OnBordingCubit>(context).onchangePage(value);
      },
      itemCount: onbordingItems.length,
      itemBuilder: (context, index) {
        return ListView(
          children: [
            const SizedBox(height: 10),
            SkipText(
                isActive: index == onbordingItems.length - 1 ? false : true),
            const SizedBox(height: 50),
            Image.asset(
              onbordingItems[index].image,
              height: 400.h,
              width: 380.w,
            ),
            SizedBox(height: 12.h),
            OnBordingIndecator(indecatorIndex: index),
            SizedBox(height: 40.h),
            Text(
              onbordingItems[index].title,
              style: AppStyle.textStyleBold25,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(onbordingItems[index].subTitle,
                style: AppStyle.textStyleBold18
                    .copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center),
            SizedBox(height: 35.h),
          ],
        );
      },
    );
  }
}
