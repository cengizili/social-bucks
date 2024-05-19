import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignUpCompleteAccountScreen extends StatelessWidget {
  SignUpCompleteAccountScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

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
                vertical: 34.v,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.h),
                      child: Text(
                        "Complete your account",
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "Lorem ipsum dolor sit amet",
                    style: CustomTextStyles.titleSmallBluegray400,
                  ),
                  SizedBox(height: 33.v),
                  _buildInputfield(context),
                  SizedBox(height: 18.v),
                  _buildInputfield1(context),
                  SizedBox(height: 18.v),
                  _buildInputfield2(context),
                  SizedBox(height: 16.v),
                  CustomDropDown(
                    icon: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgArrowdownPrimary,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ),
                    hintText: "Select a country",
                    items: dropdownItemList,
                  ),
                  SizedBox(height: 40.v),
                  CustomElevatedButton(
                    text: "Continue with Email",
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
                  SizedBox(height: 19.v),
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
                  SizedBox(height: 5.v)
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
          hintText: "Enter your first name",
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildInputfield1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Name",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: lastNameController,
          hintText: "Enter your last name",
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildInputfield2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: passwordController,
          hintText: "Create a password",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 14.v, 16.h, 14.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgHide,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 52.v,
          ),
          obscureText: true,
          contentPadding: EdgeInsets.only(
            left: 16.h,
            top: 15.v,
            bottom: 15.v,
          ),
        )
      ],
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtLargelabel(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
