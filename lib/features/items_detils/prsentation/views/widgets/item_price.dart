// import 'package:aman_store2/core/utils/app_assets.dart';
// import 'package:aman_store2/core/utils/app_colors.dart';
// import 'package:aman_store2/core/utils/app_styles.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../../../core/functions/is_arabic.dart';

// class ItemPrice extends StatelessWidget {
//   const ItemPrice({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         RichText(
//             text: TextSpan(
//                 style: AppStyle.textStyleSemiBold23
//                     .copyWith(color: AppColors.kPrimColor),
//                 text: '350',
//                 children: [
//               WidgetSpan(
//                 child: SizedBox(
//                   width: 10.w,
//                 ),
//               ),
//               TextSpan(text: 'ry2'.tr())
//             ])),
//         Container(
//           height: 45.h,
//           width: 141.w,
//           decoration: BoxDecoration(
//               color: const Color(0xffFEF1E5),
//               borderRadius: BorderRadius.circular(25.r),
//               border: Border.all(color: AppColors.kPrimColor)),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               isArabick(context)
//                   ? SvgPicture.asset(Assets.imagesOffers)
//                   : Positioned(
//                       top: -30,
//                       right: -37,
//                       child: Transform.rotate(
//                           angle: -1.5,
//                           child: SvgPicture.asset(
//                             Assets.imagesOffers,
//                             height: 30,
//                           ))),
//               Positioned(
//                 left: isArabick(context) ? null : 15,
//                 right: isArabick(context) ? 15 : null,
//                 child: Text('${'discount'.tr()} % 15-',
//                     style: AppStyle.textStyleRegular14
//                         .copyWith(color: AppColors.kPrimColor)),
//               )
//             ],
//           ),
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     RichText(
//           //         text: TextSpan(
//           //             style: AppStyle.textStyleRegular14
//           //                 .copyWith(color: AppColors.kPrimColor),
//           //             text: '${'discount'.tr()} % 15-')),
//           //     SvgPicture.asset(
//           //       Assets.imagesOffers,
//           //       colorFilter:
//           //           ColorFilter.mode(AppColors.kPrimColor, BlendMode.srcIn),
//           //     )
//           //   ],
//           // ),
//         )
//       ],
//     );
//   }
// }

import 'package:aman_store2/core/utils/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ProductPrice extends StatelessWidget {
  final dynamic price, discount, oldPrice;
  const ProductPrice({
    super.key,
    this.price,
    this.discount,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(
                    style: AppStyle.textStyleSemiBold23
                        .copyWith(color: AppColors.kPrimColor),
                    text: price,
                    children: [
                  WidgetSpan(
                    child: SizedBox(
                      width: 10.w,
                    ),
                  ),
                  TextSpan(text: 'ry2'.tr())
                ])),
            Container(
              height: 40.h,
              width: 141.w,
              decoration: BoxDecoration(
                  color: const Color(0xffFEF1E5),
                  border: Border.all(color: AppColors.kPrimColor),
                  borderRadius: BorderRadius.circular(25)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  isArabick(context)
                      ? SvgPicture.asset(Assets.imagesOffrsSharp)
                      : Positioned(
                          top: -30.h,
                          right: -37.w,
                          child: Transform.rotate(
                              angle: -1.5,
                              child: SvgPicture.asset(
                                Assets.imagesOffrsSharp,
                                height: 30.h,
                              ))),
                  Positioned(
                    left: isArabick(context) ? null : 15,
                    right: isArabick(context) ? 15 : null,
                    child: Text(
                      '${'discount'.tr()} % $discount-',
                      style: AppStyle.textStyleRegular14
                          .copyWith(color: AppColors.kPrimColor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        if (discount != 0)
          RichText(
              text: TextSpan(
                  style: AppStyle.textStyleSemiBold23.copyWith(
                      color: AppColors.kOtpBorderColor,
                      decoration: TextDecoration.lineThrough),
                  text: oldPrice,
                  children: [
                WidgetSpan(
                  child: SizedBox(
                    width: 10.w,
                  ),
                ),
                TextSpan(text: 'ry2'.tr())
              ])),
      ],
    );
  }
}
