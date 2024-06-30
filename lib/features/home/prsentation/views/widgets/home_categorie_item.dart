import 'package:aman_store2/core/constins/const.dart';
import 'package:aman_store2/core/models/categoriee_model.dart';
import 'package:aman_store2/core/routers/app_routers.dart';
import 'package:aman_store2/core/widgets/network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CategorieItem extends StatelessWidget {
  final CategorieeModel categorieeModel;
  const CategorieItem({
    super.key,
    required this.categorieeModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouters.displayItemsView,
            extra: [categorieeModel.id, categorieeModel.name]);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 74.h,
            width: 74.w,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            decoration: const BoxDecoration(
                color: AppColors.kPrimColor, shape: BoxShape.circle),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  height: 60.h,
                  width: 60.w,
                  child: NetWorkImageCached(
                      url: categorieeModel.image ?? erroeImage),
                )
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            categorieeModel.name!,
            style: AppStyle.textStyleRegular16,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
