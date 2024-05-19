import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart'; // ignore: must_be_immutable

class RecommendationItemWidget extends StatelessWidget {
  const RecommendationItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      width: 273.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 96.v),
            child: CustomIconButton(
              height: 48.adaptSize,
              width: 48.adaptSize,
              padding: EdgeInsets.all(8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgBag,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 4.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Senior UI/UX Designer",
                  style: CustomTextStyles.titleSmallErrorContainer,
                ),
                SizedBox(height: 7.v),
                Opacity(
                  opacity: 0.8,
                  child: Text(
                    "Shopee",
                    style: CustomTextStyles.labelLargeErrorContainerSemiBold,
                  ),
                ),
                SizedBox(height: 11.v),
                Opacity(
                  opacity: 0.64,
                  child: Text(
                    "Jakarta, Indonesia (Remote)",
                    style: CustomTextStyles.labelLargeErrorContainer,
                  ),
                ),
                SizedBox(height: 9.v),
                Text(
                  "\$1100 - \$12.000/Month",
                  style: CustomTextStyles.labelLargeErrorContainer_2,
                ),
                SizedBox(height: 17.v),
                SizedBox(
                  width: 180.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.h,
                          vertical: 6.v,
                        ),
                        decoration:
                            AppDecoration.fillOnSecondaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16,
                        ),
                        child: Text(
                          "Fulltime",
                          style: CustomTextStyles.labelLargeErrorContainer_1,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.h,
                          vertical: 6.v,
                        ),
                        decoration:
                            AppDecoration.fillOnSecondaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16,
                        ),
                        child: Text(
                          "Two days ago",
                          style: CustomTextStyles.labelLargeErrorContainer_1,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
