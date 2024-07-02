import 'package:aman_store2/features/saved_address/prsentation/views/widgets/add_address_view_body.dart';
import 'package:flutter/material.dart';

class AddAddressView extends StatelessWidget {
  final List data;

  const AddAddressView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const AddAddressViewBody(),
    );
  }
}
