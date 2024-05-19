import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class SavedItemWidget extends StatelessWidget {
  const SavedItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgSettings5,
      height: 48.adaptSize,
      width: 48.adaptSize,
    );
  }
}
