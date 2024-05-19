import 'package:flutter/material.dart' hide SearchController;
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class FindjobsItemWidget extends StatelessWidget {
  const FindjobsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgSettings1,
      height: 48.adaptSize,
      width: 48.adaptSize,
    );
  }
}
