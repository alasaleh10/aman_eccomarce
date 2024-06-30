import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import 'offers_continer.dart';
import 'offers_title_continer.dart';

class OffersItems extends StatelessWidget {
  const OffersItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.kPrimColor),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.imagesTestOffers,
              fit: BoxFit.cover,
            ),
          ),
          const OffersTitleContiner(title: 'مقرمشات'),
          const OffersContiner(offer: 12),
        ],
      ),
    );
  }
}
