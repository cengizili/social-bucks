import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'widgets/experience_item_widget.dart';

class ExperienceSettingScreen extends StatelessWidget {
  const ExperienceSettingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 28.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.v),
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Column(
                      children: [
                        _buildExperience(context),
                        SizedBox(height: 37.v),
                        CustomElevatedButton(
                          text: "Add New Position",
                          onPressed: () {
                            onTapAddnew(context);
                          },
                        ),
                        SizedBox(height: 32.v),
                        _buildEducation(context)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: _buildAddnew(context),
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
        text: "Experience",
      ),
    );
  }

  /// Section Widget
  Widget _buildExperience(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildRoweducation(
            context,
            education: "Experience",
            onTapEditsquare: () {
              onTapEditsquareone(context);
            },
          ),
          SizedBox(height: 15.v),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 11.5.v),
                child: SizedBox(
                  width: 295.h,
                  child: Divider(
                    height: 1.v,
                    thickness: 1.v,
                    color: appTheme.gray300,
                  ),
                ),
              );
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return ExperienceItemWidget();
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEducation(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRoweducation(
            context,
            education: "Education",
          ),
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.only(right: 83.h),
            child: Row(
              children: [
                CustomIconButton(
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  padding: EdgeInsets.all(8.h),
                  decoration: IconButtonStyleHelper.fillGray,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFrame162724,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 5.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "University of Oxford",
                          style: CustomTextStyles.titleSmallSemiBold,
                        ),
                        SizedBox(height: 6.v),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 1.v),
                              child: Text(
                                "Computer Science",
                                style: theme.textTheme.labelLarge,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 4.h,
                                top: 1.v,
                              ),
                              child: Text(
                                "•",
                                style: theme.textTheme.labelLarge,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Text(
                                "2019",
                                style: theme.textTheme.labelLarge,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAddnew(BuildContext context) {
    return CustomElevatedButton(
      text: "Add New Education",
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 55.v,
      ),
      onPressed: () {
        onTapAddnew1(context);
      },
    );
  }

  /// Common widget
  Widget _buildRoweducation(
    BuildContext context, {
    required String education,
    Function? onTapEditsquare,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: Text(
            education,
            style: CustomTextStyles.titleMediumPrimaryBold_1.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgEditSquarePrimary,
          height: 24.adaptSize,
          width: 24.adaptSize,
          onTap: () {
            onTapEditsquare?.call();
          },
        )
      ],
    );
  }

  /// Navigates to the newPositionScreen when the action is triggered.
  onTapEditsquareone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newPositionScreen);
  }

  /// Navigates to the newPositionScreen when the action is triggered.
  onTapAddnew(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newPositionScreen);
  }

  /// Navigates to the addNewEducationScreen when the action is triggered.
  onTapAddnew1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addNewEducationScreen);
  }
}
