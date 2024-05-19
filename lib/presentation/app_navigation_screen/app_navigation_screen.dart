import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../apply_job_popup_dialog/apply_job_popup_dialog.dart';
import '../confirmation_dialog/confirmation_dialog.dart';
import '../filter_bottomsheet/filter_bottomsheet.dart';
import '../logout_popup_dialog/logout_popup_dialog.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.errorContainer.withOpacity(1),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: AppDecoration.white,
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Splash Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Onboarding One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.onboardingOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Onboarding Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.onboardingTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Onboarding Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.onboardingThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up - Create Acount",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signUpCreateAcountScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up - Complete Account ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signUpCompleteAccountScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Job Type",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.jobTypeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Speciallization",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.speciallizationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Confirmation - Dialog",
                          onTapScreenTitle: () =>
                              onTapDialogTitle(context, ConfirmationDialog()),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Enter OTP",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.enterOtpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homeContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.searchScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Filter - BottomSheet",
                          onTapScreenTitle: () => onTapBottomSheetTitle(
                              context, FilterBottomsheet()),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Job Details - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.jobDetailsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Apply Job",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.applyJobScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Apply Job Popup - Dialog",
                          onTapScreenTitle: () =>
                              onTapDialogTitle(context, ApplyJobPopupDialog()),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "My Proposals - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myProposalsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Settings",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.settingsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Logout-popup - Dialog",
                          onTapScreenTitle: () =>
                              onTapDialogTitle(context, LogoutPopupDialog()),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Personal Info",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.personalInfoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Experience Setting",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.experienceSettingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "New Position",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.newPositionScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add New Education",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addNewEducationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Privacy",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.privacyScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Language",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.languageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notifications",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationsScreen),
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
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: AppDecoration.white,
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appTheme.blueGray40001,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: appTheme.black900,
          )
        ],
      ),
    );
  }

  /// Common click event for dialog
  void onTapDialogTitle(
    BuildContext context,
    Widget className,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: className,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
        );
      },
    );
  }

  /// Common click event for bottomsheet
  void onTapBottomSheetTitle(
    BuildContext context,
    Widget className,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return className;
      },
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: AppDecoration.white,
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.blueGray40001,
            )
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
