import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'delivery_location_listtile.dart';
import 'follow_order_count.dart';
import 'follow_order_number.dart';
import 'follow_order_scound_table.dart';
import 'follow_order_steper.dart';
import 'follow_order_top_table.dart';
import 'follow_orders_items.dart';
import 'follow_rating.dart';

class FollowOrderBodyView extends StatelessWidget {
  const FollowOrderBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FadeIn(
        delay: const Duration(milliseconds: 150),
        child: CustomScrollView(
          slivers: [
            const FollowOrderNumber(orderNo: 500),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            FollowOrderTopTable(
              deliveryDate: '2023/7/9 اليوم',
              orderDate: '2023/7/9 2:50 PM',
              status: 1,
              total: '350  ${'ry'.tr()}',
            ),
            const DeliveryLocationListTile(
                deliveryLocation:
                    'حضرموت – سيئون – شارع الجزائر – عمارة الكاف – شقة رقم 6'),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            const FollowOrderStepper(
              status: 3,
              delveryDate: '2023/12/5 12:00 PM',
              orderDate: '2023/12/5 12:00 PM',
              orderReadyDate: '2023/12/5 12:00 PM',
              reciveDate: '2023/12/5 12:00 PM',
            ),
            SliverToBoxAdapter(child: SizedBox(height: 15.h)),
            const FollowOrderCount(count: 2),
            const FollowOrdersItems(),
            SliverToBoxAdapter(child: SizedBox(height: 15.h)),
            FollowOrderScoundTable(
              deliveryPrice: '350  ${'ry'.tr()}',
              discount: '_',
              paymentMethod: 'عبر العمقي',
              total: '350  ${'ry'.tr()}',
            ),
            if (3 > 2) const FlolowRating(),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          ],
        ),
      ),
    );
  }
}
