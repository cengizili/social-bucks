import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'widgets/chipviewskills_item_widget.dart';
import 'widgets/profile_item_widget.dart'; // ignore_for_file: must_be_immutable

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30.v),
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                children: [
                  _buildStackbgone(context),
                  SizedBox(height: 16.v),
                  Container(
                    width: 273.h,
                    margin: EdgeInsets.only(
                      left: 51.h,
                      right: 50.h,
                    ),
                    child: Text(
                      "UI/UX Designer, Web Design, Mobile App Design",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.titleSmallBluegray400.copyWith(
                        height: 1.57,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _buildApplied(
                            context,
                            typesixteenOne: "25",
                            reviewed: "Applied",
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 17.h),
                            child: _buildApplied(
                              context,
                              typesixteenOne: "10",
                              reviewed: "Reviewed",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24.v),
                  Divider(
                    color: appTheme.gray300,
                  ),
                  SizedBox(height: 22.v),
                  _buildAboutme(context),
                  SizedBox(height: 24.v),
                  _buildSkills(context),
                  SizedBox(height: 24.v),
                  _buildExperience(context),
                  SizedBox(height: 24.v),
                  _buildEducation(context)
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
      centerTitle: true,
      title: AppbarTitle(
        text: "Profile",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgComponent3Primary,
          margin: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 13.v,
          ),
          onTap: () {
            onTapImageone(context);
          },
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildStackbgone(BuildContext context) {
    return SizedBox(
      height: 225.v,
      width: 327.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgBg,
            height: 120.v,
            width: 327.h,
            radius: BorderRadius.circular(
              8.h,
            ),
            alignment: Alignment.topCenter,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 87.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img63,
                    height: 89.adaptSize,
                    width: 89.adaptSize,
                    radius: BorderRadius.circular(
                      44.h,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "Gustavo Lipshutz",
                    style: CustomTextStyles.titleMediumBlack900,
                  ),
                  SizedBox(height: 7.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text(
                          "Open to work",
                          style: CustomTextStyles.titleSmallGray500SemiBold,
                        ),
                      ),
                      Container(
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        margin: EdgeInsets.only(
                          left: 10.h,
                          bottom: 3.v,
                        ),
                        padding: EdgeInsets.all(3.h),
                        decoration: AppDecoration.success.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgCheck,
                          height: 9.adaptSize,
                          width: 9.adaptSize,
                          alignment: Alignment.center,
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
    );
  }

  /// Section Widget
  Widget _buildAboutme(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          _buildRowskills(
            context,
            skills: "About Me",
            editsquare: ImageConstant.imgEditSquare,
          ),
          SizedBox(height: 14.v),
          Container(
            width: 272.h,
            margin: EdgeInsets.only(right: 22.h),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero, cursus molestie nullam ac pharetra est nec enim. Vel eleifend semper nunc faucibus donec pretium.",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleSmallBluegray400.copyWith(
                height: 1.57,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSkills(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 23.h),
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.h),
            child: _buildRowskills(
              context,
              skills: "Skills",
              editsquare: ImageConstant.imgEditSquare,
            ),
          ),
          SizedBox(height: 12.v),
          Wrap(
            runSpacing: 12.v,
            spacing: 12.h,
            children:
                List<Widget>.generate(8, (index) => ChipviewskillsItemWidget()),
          ),
          SizedBox(height: 17.v)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildExperience(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildRowskills(
            context,
            skills: "Experience",
            editsquare: ImageConstant.imgEditSquarePrimary,
            onTapEditsquare: () {
              onTapEditsquare(context);
            },
          ),
          SizedBox(height: 15.v),
          SizedBox(
            height: 222.v,
            width: 295.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 63.v),
                    child: SizedBox(
                      width: 295.h,
                      child: Divider(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 19.5.v),
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
                      return ProfileItemWidget();
                    },
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
  Widget _buildEducation(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRowskills(
            context,
            skills: "Education",
            editsquare: ImageConstant.imgEditSquarePrimary,
          ),
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.only(right: 83.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGroup162942,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
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

  /// Common widget
  Widget _buildApplied(
    BuildContext context, {
    required String typesixteenOne,
    required String reviewed,
  }) {
    return Container(
      width: 134.h,
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              typesixteenOne,
              style: CustomTextStyles.titleMediumPrimaryBold_1.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 2.v,
              bottom: 3.v,
            ),
            child: Text(
              reviewed,
              style: theme.textTheme.labelLarge!.copyWith(
                color: appTheme.blueGray400,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRowskills(
    BuildContext context, {
    required String skills,
    required String editsquare,
    Function? onTapEditsquare,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: Text(
            skills,
            style: CustomTextStyles.titleMediumPrimarySemiBold.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        CustomImageView(
          imagePath: editsquare,
          height: 24.adaptSize,
          width: 24.adaptSize,
          onTap: () {
            onTapEditsquare?.call();
          },
        )
      ],
    );
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImageone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingsScreen);
  }

  /// Navigates to the newPositionScreen when the action is triggered.
  onTapEditsquare(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newPositionScreen);
  }
}
