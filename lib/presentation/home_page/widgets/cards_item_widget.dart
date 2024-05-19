import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class CardsItemWidget extends StatelessWidget {
  const CardsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgSettings,
      height: 48.adaptSize,
      width: 48.adaptSize,
    );
  }
}
