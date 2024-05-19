import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class ListchinesesItemWidget extends StatelessWidget {
  const ListchinesesItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      "Chineses",
      style: CustomTextStyles.titleMediumPrimarySemiBold,
    );
  }
}
