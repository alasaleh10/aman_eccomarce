import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../view_model/rating_trying_cuibt/rating_trying_cubit.dart';
import 'rating_face.dart';

class RatingFacesListTile extends StatelessWidget {
  const RatingFacesListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final cuibt = BlocProvider.of<RatingTryingCubit>(context);

    return ListTile(
        // minVerticalPadding: 15,
        title: BlocBuilder<RatingTryingCubit, RatingTryingState>(
          buildWhen: (previous, current) => current is RatingTryingInitial,
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  cuibt.icons.length,
                  (index) => RatingFace(
                        animate: index == cuibt.index ? cuibt.animat : true,
                        onTap: () {
                          cuibt.changeRate(index: index);
                        },
                        isActive: cuibt.index == index,
                        icon: cuibt.icons[index],
                      )),
            );
          },
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'whatDoYouThinkUs'.tr(),
            style: AppStyle.textStyleBold25.copyWith(
                color: const Color(0xff8B959E), fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
