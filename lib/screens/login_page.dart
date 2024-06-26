import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 31.v,
            ),
            child: Column(
              children: [
                SizedBox(height: 50.v,),
                CustomImageView(
                  imagePath: ImageConstant.imgClarityEmployeeSolid,
                  color: theme.primaryColor,
                ),
                Text(
                  "Social Bucks",
                  style: theme.textTheme.headlineSmall,
                ),
                SizedBox(height: 11.v),
                LocaleText(
                  "Ultimate way to earn money with social media",
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 28.v),
                CustomOutlinedButton(
                  text: "Continue with Google",
                  onPressed: () async {
                    await Session.instance.login();
                  },
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 12.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgGooglesymbol1,
                      height: 23.v,
                      width: 24.h,
                    ),
                  ),
                ),
                SizedBox(height: 16.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.v),
                        child: SizedBox(
                          width: 40.h,
                          child: Divider(
                            color: appTheme.blueGray100,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.h),
                        child: Container(
                          width: 160.h,
                          child: LocaleText(
                            "By signing in you agree to our Terms and Conditions of Use",
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.titleSmallGray500SemiBold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.v),
                        child: SizedBox(
                          width: 52.h,
                          child: Divider(
                            indent: 12.h,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 84.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 13.v,
          bottom: 13.v,
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgComponent3,
          margin: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 13.v,
          ),
        )
      ],
    );
  }



  /// Navigates to the signUpCompleteAccountScreen when the action is triggered.
  onTapContinuewith(BuildContext context) {
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtLargelabel(BuildContext context) {
  }
}
