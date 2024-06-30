import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

bool isArabick(BuildContext context) {
  if (context.locale.toString() == 'ar') return true;

  return false;
}
