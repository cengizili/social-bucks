import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart'; // ignore_for_file: must_be_immutable

class LogoutPopupDialog extends StatelessWidget {
  const LogoutPopupDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SingleChildScrollView(
          child: _buildPopup(context),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildPopup(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 36.h,
        right: 36.h,
        bottom: 233.v,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 40.v,
      ),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 9.v),
          SizedBox(
            height: 82.adaptSize,
            width: 82.adaptSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgProfileOnprimary,
                          height: 31.v,
                          width: 24.h,
                        ),
                        SizedBox(height: 3.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgPlayOnprimary,
                          height: 6.adaptSize,
                          width: 6.adaptSize,
                        )
                      ],
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgContrast,
                  height: 82.adaptSize,
                  width: 82.adaptSize,
                  alignment: Alignment.center,
                )
              ],
            ),
          ),
          SizedBox(height: 35.v),
          Text(
            "Are You Sure?",
            style: CustomTextStyles.titleMediumPrimaryBold,
          ),
          SizedBox(height: 8.v),
          Container(
            width: 229.h,
            margin: EdgeInsets.only(
              left: 6.h,
              right: 5.h,
            ),
            child: Text(
              "Ullamcorper imperdiet urna id non sed est sem.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleSmallBluegray400SemiBold.copyWith(
                height: 1.57,
              ),
            ),
          ),
          SizedBox(height: 21.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  height: 46.v,
                  text: "Log Out",
                  margin: EdgeInsets.only(right: 6.h),
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL20,
                  buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
                  onPressed: () {
                    onTapLogout(context);
                  },
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  height: 46.v,
                  text: "Cancel",
                  margin: EdgeInsets.only(left: 6.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallErrorContainerSemiBold,
                  onPressed: () {
                    onTapCancel(context);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /// Navigates to the signUpCreateAcountScreen when the action is triggered.
  onTapLogout(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpCreateAcountScreen);
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapCancel(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingsScreen);
  }
}
