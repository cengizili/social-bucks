import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 32.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5.v),
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: Column(
                        children: [
                          _buildInputfield(context),
                          SizedBox(height: 18.v),
                          _buildInputfield1(context),
                          SizedBox(height: 18.v),
                          _buildInputfield2(context),
                          SizedBox(height: 18.v),
                          _buildInputfield3(context),
                          SizedBox(height: 18.v),
                          _buildInputfield4(context)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildSavechanges(context),
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
      centerTitle: true,
      title: AppbarTitle(
        text: "Personal Info",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgEditSquare,
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
          "First Name",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: firstNameController,
          hintText: "Gustavo",
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
          hintText: "Lipshutz",
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
          "Email",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: emailController,
          hintText: "xyz@gmail.com",
          textInputType: TextInputType.emailAddress,
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildInputfield3(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone ",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: phoneController,
          hintText: "+1 1234567890",
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildInputfield4(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: locationController,
          hintText: "Lorem ipsun",
          textInputAction: TextInputAction.done,
          maxLines: 6,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 20.v,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildSavechanges(BuildContext context) {
    return CustomElevatedButton(
      text: "Save Changes",
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 44.v,
      ),
      buttonStyle: CustomButtonStyles.fillGrayTL24,
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryContainer,
    );
  }
}
