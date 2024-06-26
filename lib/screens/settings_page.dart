import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_bucks/core/utils/validation_functions.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key})
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
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.v),
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Column(
                      children: [
                        SizedBox(height: 32.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: LocaleText(
                            "About",
                            style: CustomTextStyles.labelLargeSemiBold,
                          ),
                        ),
                        SizedBox(height: 16.v),
                        _buildSettingsTile(
                          context,
                          imagePath: ImageConstant.imgShieldDone,
                          title: "Privacy Policy",
                          onTapAccount: () async {
                            await launchMyUrl(directUrl: "https://www.termsfeed.com/live/200841b5-6f5f-48c9-b175-581e61a4f2f3");
                          },
                        ),
                        SizedBox(height: 16.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Divider(
                            indent: 36.h,
                          ),
                        ),
                        SizedBox(height: 16.v),
                        _buildSettingsTile(
                          context,
                          imagePath: ImageConstant.imgProfile,
                          title: "Support",
                          onTapAccount: () async {
                            await launchMyUrl(directUrl: "mailto:starboost.service@gmail.com?subject=SOCIAL-BUCKS-${FirebaseAuth.instance.currentUser?.uid}");
                          },
                        ),
                        SizedBox(height: 25.v),
                        GestureDetector(
                          onTap: () async {
                             Nav.toNamed(AppRoutes.splash);
                             await FirebaseAuth.instance.signOut();
                             Nav.toNamed(AppRoutes.login);
                          },
                          child: LocaleText(
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

  /// Common widget
  Widget _buildSettingsTile(
    BuildContext context, {
    required String imagePath,
    required String title,
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
            imagePath: imagePath,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(top: 3.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 5.v,
            ),
            child: LocaleText(
              title,
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
      height: 50.v,
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
                        child: LocaleText(
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

  /// Navigates to the personalInfoScreen when the action is triggered.
 
}
