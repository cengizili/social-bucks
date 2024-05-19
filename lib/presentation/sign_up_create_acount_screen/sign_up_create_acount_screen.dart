import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignUpCreateAcountScreen extends StatelessWidget {
  SignUpCreateAcountScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 31.v,
              ),
              child: Column(
                children: [
                  Text(
                    "Create account",
                    style: theme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 11.v),
                  Text(
                    "Lorem ipsum dolor sit amet",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 28.v),
                  CustomOutlinedButton(
                    text: "Continue with Google",
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
                  CustomOutlinedButton(
                    text: "Continue with Apple",
                    leftIcon: Container(
                      margin: EdgeInsets.only(right: 12.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgIconApple,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ),
                  ),
                  SizedBox(height: 26.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 33.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.v),
                          child: SizedBox(
                            width: 63.h,
                            child: Divider(
                              color: appTheme.blueGray100,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "or continue with",
                            style: CustomTextStyles.titleSmallGray500SemiBold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.v),
                          child: SizedBox(
                            width: 75.h,
                            child: Divider(
                              indent: 12.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 28.v),
                  _buildInputfield(context),
                  SizedBox(height: 40.v),
                  CustomElevatedButton(
                    text: "Continue with Email",
                    onPressed: () {
                      onTapContinuewith(context);
                    },
                  ),
                  SizedBox(height: 28.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: CustomTextStyles.titleMediumGray500,
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapTxtLargelabel(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: Text(
                              " Login",
                              style:
                                  CustomTextStyles.titleMediumPrimarySemiBold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 84.v),
                  Container(
                    width: 245.h,
                    margin: EdgeInsets.symmetric(horizontal: 40.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "By signing up you agree to our ",
                            style: CustomTextStyles.titleSmallGray500,
                          ),
                          TextSpan(
                            text: "Terms",
                            style: CustomTextStyles.titleSmallBlack900,
                          ),
                          TextSpan(
                            text: " and ",
                            style: CustomTextStyles.titleSmallGray500,
                          ),
                          TextSpan(
                            text: "Conditions of Use",
                            style: CustomTextStyles.titleSmallBlack900,
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8.v)
                ],
              ),
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

  /// Section Widget
  Widget _buildInputfield(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: emailController,
          hintText: "Enter your email address",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.emailAddress,
        )
      ],
    );
  }

  /// Navigates to the signUpCompleteAccountScreen when the action is triggered.
  onTapContinuewith(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpCompleteAccountScreen);
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtLargelabel(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
