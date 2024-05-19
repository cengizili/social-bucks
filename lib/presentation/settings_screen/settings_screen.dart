import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home_page/home_page.dart';
import '../logout_popup_dialog/logout_popup_dialog.dart';
import '../profile_page/profile_page.dart';
import '../saved_page/saved_page.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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
                        _buildRowsixtyfive(context),
                        SizedBox(height: 32.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Account",
                            style: CustomTextStyles.labelLargeSemiBold,
                          ),
                        ),
                        SizedBox(height: 15.v),
                        _buildAccount(
                          context,
                          bellOne: ImageConstant.imgPerson,
                          notification: "Personal Info",
                          onTapAccount: () {
                            onTapAccount(context);
                          },
                        ),
                        SizedBox(height: 16.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Divider(
                            indent: 36.h,
                          ),
                        ),
                        SizedBox(height: 15.v),
                        _buildStacklanguage(
                          context,
                          language: "Experience",
                          globeOne: ImageConstant.imgThumbsUp,
                          onTapAccount: () {
                            onTapAccount1(context);
                          },
                        ),
                        SizedBox(height: 26.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "General",
                            style: CustomTextStyles.labelLargeSemiBold,
                          ),
                        ),
                        SizedBox(height: 15.v),
                        _buildAccount(
                          context,
                          bellOne: ImageConstant.imgBell,
                          notification: "Notification",
                          onTapAccount: () {
                            onTapAccount2(context);
                          },
                        ),
                        SizedBox(height: 16.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Divider(
                            indent: 36.h,
                          ),
                        ),
                        SizedBox(height: 15.v),
                        _buildStacklanguage(
                          context,
                          language: "Language",
                          globeOne: ImageConstant.imgGlobe,
                          onTapAccount: () {
                            onTapAccount3(context);
                          },
                        ),
                        SizedBox(height: 15.v),
                        _buildStacklanguage(
                          context,
                          language: "Security",
                          globeOne: ImageConstant.imgShieldDone,
                          onTapAccount: () {
                            onTapAccount4(context);
                          },
                        ),
                        SizedBox(height: 26.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "About",
                            style: CustomTextStyles.labelLargeSemiBold,
                          ),
                        ),
                        SizedBox(height: 16.v),
                        _buildStacklanguage(
                          context,
                          language: "Legal and Policies",
                          globeOne: ImageConstant.imgShield,
                          onTapAccount: () {
                            onTapAccount5(context);
                          },
                        ),
                        SizedBox(height: 16.v),
                        _buildStacklanguage(
                          context,
                          language: "Help & Feedback",
                          globeOne: ImageConstant.imgProfile,
                          onTapAccount: () {
                            onTapAccount6(context);
                          },
                        ),
                        SizedBox(height: 16.v),
                        _buildAccount(
                          context,
                          bellOne: ImageConstant.imgVideoCamera,
                          notification: "About Us",
                          onTapAccount: () {
                            onTapAccount7(context);
                          },
                        ),
                        SizedBox(height: 25.v),
                        GestureDetector(
                          onTap: () {
                            onTapTxtLargelabel(context);
                          },
                          child: Text(
                            "Logout",
                            style: CustomTextStyles.titleMediumOnPrimary,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: _buildBottombar(context),
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
        text: "Settings",
      ),
    );
  }

  /// Section Widget
  Widget _buildRowsixtyfive(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.only(
              top: 5.v,
              bottom: 4.v,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: theme.colorScheme.errorContainer.withOpacity(1),
                width: 4.h,
              ),
              borderRadius: BorderRadiusStyle.roundedBorder32,
            ),
            child: Container(
              height: 64.adaptSize,
              width: 64.adaptSize,
              decoration: AppDecoration.outlineErrorContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder32,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 64.adaptSize,
                      width: 64.adaptSize,
                      child: CircularProgressIndicator(
                        value: 0.5,
                        strokeWidth: 2.h,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "65%",
                      style: CustomTextStyles.titleMediumErrorContainer,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 8.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile Completeness",
                  style: CustomTextStyles.titleMediumErrorContainer,
                ),
                SizedBox(height: 4.v),
                Opacity(
                  opacity: 0.8,
                  child: SizedBox(
                    width: 185.h,
                    child: Text(
                      "Quality profiles are 5 times more likely to get hired by clients.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          CustomTextStyles.labelLargeErrorContainer_1.copyWith(
                        height: 1.67,
                      ),
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
  Widget _buildBottombar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  /// Common widget
  Widget _buildAccount(
    BuildContext context, {
    required String bellOne,
    required String notification,
    Function? onTapAccount,
  }) {
    return GestureDetector(
      onTap: () {
        onTapAccount?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: bellOne,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(top: 3.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 5.v,
            ),
            child: Text(
              notification,
              style: CustomTextStyles.titleMediumPrimarySemiBold.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(bottom: 3.v),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildStacklanguage(
    BuildContext context, {
    required String language,
    required String globeOne,
    Function? onTapAccount,
  }) {
    return SizedBox(
      height: 43.v,
      width: 327.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(left: 36.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 7.v),
                        child: Text(
                          language,
                          style: CustomTextStyles.titleMediumPrimarySemiBold
                              .copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowRight,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.only(bottom: 4.v),
                      )
                    ],
                  ),
                  SizedBox(height: 14.v),
                  Divider()
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTapAccount?.call();
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 1.v),
                    CustomImageView(
                      imagePath: globeOne,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Message:
        return "/";
      case BottomBarEnum.Saved:
        return AppRoutes.savedPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.savedPage:
        return SavedPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the personalInfoScreen when the action is triggered.
  onTapAccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoScreen);
  }

  /// Navigates to the personalInfoScreen when the action is triggered.
  onTapAccount1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoScreen);
  }

  /// Navigates to the personalInfoScreen when the action is triggered.
  onTapAccount2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoScreen);
  }

  /// Navigates to the personalInfoScreen when the action is triggered.
  onTapAccount3(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoScreen);
  }

  /// Navigates to the personalInfoScreen when the action is triggered.
  onTapAccount4(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoScreen);
  }

  /// Navigates to the personalInfoScreen when the action is triggered.
  onTapAccount5(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoScreen);
  }

  /// Navigates to the personalInfoScreen when the action is triggered.
  onTapAccount6(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoScreen);
  }

  /// Navigates to the personalInfoScreen when the action is triggered.
  onTapAccount7(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.personalInfoScreen);
  }

  /// Displays a dialog with the [LogoutPopupDialog] content.
  onTapTxtLargelabel(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: LogoutPopupDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
            ));
  }
}
