import 'package:aman_store2/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';

displaySnackBar(BuildContext context,
    {required String message, bool isError = true}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(customSnackBar(context, title: message, isError: isError));
}
