import 'package:flutter/material.dart';

import '../widgets/custom_snack_bar.dart';

showSnackBar(BuildContext context,
    {required String message, bool isError = true}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(customSnackBar(context, title: message, isError: isError));
}
