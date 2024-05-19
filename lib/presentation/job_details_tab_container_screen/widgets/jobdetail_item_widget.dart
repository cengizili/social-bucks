import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class JobdetailItemWidget extends StatelessWidget {
  const JobdetailItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67.h,
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFloatingIcon,
            height: 48.adaptSize,
            width: 48.adaptSize,
          ),
          SizedBox(height: 9.v),
          Text(
            "Salary",
            style: CustomTextStyles.labelLargeGray500_1,
          ),
          SizedBox(height: 9.v),
          Text(
            "\$6k - \$11k",
            style: CustomTextStyles.titleSmallSemiBold,
          )
        ],
      ),
    );
  }
}
