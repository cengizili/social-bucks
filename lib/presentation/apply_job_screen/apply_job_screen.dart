import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../apply_job_popup_dialog/apply_job_popup_dialog.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ApplyJobScreen extends StatelessWidget {
  ApplyJobScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController frameoneController = TextEditingController();

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
                  _buildInputfield(context),
                  SizedBox(height: 26.v),
                  _buildInputfield1(context),
                  SizedBox(height: 28.v),
                  _buildCvfields(context),
                  SizedBox(height: 28.v),
                  _buildInputfield2(context),
                  SizedBox(height: 5.v)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildContinue(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      height: 51.v,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 13.v,
          bottom: 14.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Apply Job",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgComponent3,
          margin: EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 14.v),
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
          "Full Name",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: fullNameController,
          hintText: "Brooklyn Simmons",
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
          "Email Address",
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
  Widget _buildCvfields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload CV",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 7.v),
        DottedBorder(
          color: appTheme.gray300,
          padding: EdgeInsets.only(
            left: 1.h,
            top: 1.v,
            right: 1.h,
            bottom: 1.v,
          ),
          strokeWidth: 1.h,
          radius: Radius.circular(24),
          borderType: BorderType.RRect,
          dashPattern: [6, 6],
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 124.h,
              vertical: 39.v,
            ),
            decoration: AppDecoration.outlineGray3001.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCloudUpload1,
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                ),
                SizedBox(height: 8.v),
                Text(
                  "Upload File",
                  style: CustomTextStyles.titleSmallSemiBold,
                )
              ],
            ),
          ),
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
          "Website, Blog, or Portfolio",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 7.v),
        CustomTextFormField(
          controller: frameoneController,
          hintText: "http://...",
          textInputAction: TextInputAction.done,
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
      text: "Continue",
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 40.v,
      ),
      onPressed: () {
        onTapContinue(context);
      },
    );
  }

  /// Displays a dialog with the [ApplyJobPopupDialog] content.
  onTapContinue(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: ApplyJobPopupDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
            ));
  }
}
