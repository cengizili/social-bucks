import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class JobTypeItemWidget extends StatelessWidget {
  const JobTypeItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      width: 156.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          CustomImageView(
            imagePath: ImageConstant.imgUser,
            height: 64.adaptSize,
            width: 64.adaptSize,
          ),
          SizedBox(height: 29.v),
          Text(
            "Find a job",
            style: CustomTextStyles.titleMediumPrimarySemiBold,
          ),
          SizedBox(height: 9.v),
          SizedBox(
            width: 120.h,
            child: Text(
              "It’s easy to find your dream jobs here with us.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.labelLargeGray500_1.copyWith(
                height: 1.67,
              ),
            ),
          )
        ],
      ),
    );
  }
}
