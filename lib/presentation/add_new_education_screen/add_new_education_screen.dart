import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AddNewEducationScreen extends StatelessWidget {
  AddNewEducationScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController frameoneController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController frameoneoneController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController date1Controller = TextEditingController();

  TextEditingController frameonetwoController = TextEditingController();

  TextEditingController frameonethreeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: SizedBox(
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
                        SizedBox(height: 20.v),
                        _buildInputfield1(context),
                        SizedBox(height: 20.v),
                        _buildInputfield2(context),
                        SizedBox(height: 18.v),
                        _buildInputfield3(context),
                        SizedBox(height: 18.v),
                        _buildInputfield4(context),
                        SizedBox(height: 18.v),
                        _buildInputfield5(context),
                        SizedBox(height: 20.v),
                        _buildInputfield6(context)
                      ],
                    ),
                  ),
                ),
              )
            ],
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
        text: "Add New Education",
      ),
    );
  }

  /// Section Widget
  Widget _buildInputfield(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "School",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: frameoneController,
          hintText: "Ex: Harvard University",
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
          "Degree",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 7.v),
        CustomDropDown(
          icon: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowdown,
              height: 9.v,
              width: 14.h,
            ),
          ),
          hintText: "Ex: Bachelor",
          items: dropdownItemList,
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
          "Field of study",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 7.v),
        CustomTextFormField(
          controller: frameoneoneController,
          hintText: "Ex: Business",
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
          "Start Date",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: dateController,
          hintText: "Select Date",
          suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 14.v, 16.h, 14.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgCalendarPrimary,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 52.v,
          ),
          contentPadding: EdgeInsets.only(
            left: 16.h,
            top: 15.v,
            bottom: 15.v,
          ),
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
          "End Date",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: date1Controller,
          hintText: "Select Date",
          suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 14.v, 16.h, 14.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgCalendarPrimary,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 52.v,
          ),
          contentPadding: EdgeInsets.only(
            left: 16.h,
            top: 15.v,
            bottom: 15.v,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildInputfield5(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Grade",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: frameonetwoController,
          hintText: "Ex: Business",
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildInputfield6(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 7.v),
        CustomTextFormField(
          controller: frameonethreeController,
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
        bottom: 37.v,
      ),
      onPressed: () {
        onTapSavechanges(context);
      },
    );
  }

  /// Navigates to the experienceSettingScreen when the action is triggered.
  onTapSavechanges(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.experienceSettingScreen);
  }
}
