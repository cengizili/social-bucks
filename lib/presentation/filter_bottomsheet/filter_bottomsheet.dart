import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart'; // ignore_for_file: must_be_immutable

class FilterBottomsheet extends StatelessWidget {
  const FilterBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return _buildRowsenioruiux(context);
  }

  /// Section Widget
  Widget _buildRowsenioruiux(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 68.v),
            child: CustomIconButton(
              height: 48.adaptSize,
              width: 48.adaptSize,
              padding: EdgeInsets.all(7.h),
              decoration: IconButtonStyleHelper.fillGray,
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup,
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
                  style: CustomTextStyles.titleMediumPrimaryBold_1,
                ),
                SizedBox(height: 5.v),
                Text(
                  "Shell",
                  style: CustomTextStyles.labelLargeGray500,
                ),
                SizedBox(height: 12.v),
                Text(
                  "\$560 - \$12.000/Month",
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 13.v),
                SizedBox(
                  width: 181.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        height: 28.v,
                        width: 70.h,
                        text: "Fulltime",
                        buttonStyle: CustomButtonStyles.fillGray,
                        buttonTextStyle: theme.textTheme.labelLarge!,
                      ),
                      CustomElevatedButton(
                        height: 28.v,
                        width: 103.h,
                        text: "Two days ago",
                        buttonStyle: CustomButtonStyles.fillGray,
                        buttonTextStyle: theme.textTheme.labelLarge!,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgComponent3,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(
              left: 30.h,
              bottom: 92.v,
            ),
          )
        ],
      ),
    );
  }
}
