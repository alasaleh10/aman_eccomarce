import 'package:easy_localization/easy_localization.dart';

String productCounter({required int count}) {
  if (count == 0) {
    return 'noProducts'.tr();
  } else if (count == 1) {
    return 'oneProduct'.tr();
  } else if (count == 2) {
    return 'towProducts'.tr();
  } else if (count > 2 && count < 11) {
    return '$count ${'productss'.tr()}';
  } else {
    return '$count ${'product'.tr()}';
  }
}
