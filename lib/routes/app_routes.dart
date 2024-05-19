import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/add_new_education_screen/add_new_education_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/apply_job_screen/apply_job_screen.dart';
import '../presentation/enter_otp_screen/enter_otp_screen.dart';
import '../presentation/experience_setting_screen/experience_setting_screen.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/job_details_tab_container_screen/job_details_tab_container_screen.dart';
import '../presentation/job_type_screen/job_type_screen.dart';
import '../presentation/language_screen/language_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/my_proposals_tab_container_screen/my_proposals_tab_container_screen.dart';
import '../presentation/new_position_screen/new_position_screen.dart';
import '../presentation/notifications_screen/notifications_screen.dart';
import '../presentation/onboarding_one_screen/onboarding_one_screen.dart';
import '../presentation/onboarding_three_screen/onboarding_three_screen.dart';
import '../presentation/onboarding_two_screen/onboarding_two_screen.dart';
import '../presentation/personal_info_screen/personal_info_screen.dart';
import '../presentation/privacy_screen/privacy_screen.dart';
import '../presentation/search_screen/search_screen.dart';
import '../presentation/settings_screen/settings_screen.dart';
import '../presentation/sign_up_complete_account_screen/sign_up_complete_account_screen.dart';
import '../presentation/sign_up_create_acount_screen/sign_up_create_acount_screen.dart';
import '../presentation/speciallization_screen/speciallization_screen.dart';
import '../presentation/splash_screen/splash_screen.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String signUpCreateAcountScreen =
      '/sign_up_create_acount_screen';

  static const String signUpCompleteAccountScreen =
      '/sign_up_complete_account_screen';

  static const String jobTypeScreen = '/job_type_screen';

  static const String speciallizationScreen = '/speciallization_screen';

  static const String loginScreen = '/login_screen';

  static const String enterOtpScreen = '/enter_otp_screen';

  static const String homeContainerScreen = '/home_container_screen';

  static const String homePage = '/home_page';

  static const String searchScreen = '/search_screen';

  static const String jobDetailsPage = '/job_details_page';

  static const String jobDetailsTabContainerScreen =
      '/job_details_tab_container_screen';

  static const String savedPage = '/saved_page';

  static const String savedDetailJobPage = '/saved_detail_job_page';

  static const String applyJobScreen = '/apply_job_screen';

  static const String generalPage = '/general_page';

  static const String myProposalsPage = '/my_proposals_page';

  static const String myProposalsTabContainerScreen =
      '/my_proposals_tab_container_screen';

  static const String profilePage = '/profile_page';

  static const String settingsScreen = '/settings_screen';

  static const String personalInfoScreen = '/personal_info_screen';

  static const String experienceSettingScreen = '/experience_setting_screen';

  static const String newPositionScreen = '/new_position_screen';

  static const String addNewEducationScreen = '/add_new_education_screen';

  static const String privacyScreen = '/privacy_screen';

  static const String languageScreen = '/language_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    onboardingOneScreen: (context) => OnboardingOneScreen(),
    onboardingTwoScreen: (context) => OnboardingTwoScreen(),
    onboardingThreeScreen: (context) => OnboardingThreeScreen(),
    signUpCreateAcountScreen: (context) => SignUpCreateAcountScreen(),
    signUpCompleteAccountScreen: (context) => SignUpCompleteAccountScreen(),
    jobTypeScreen: (context) => JobTypeScreen(),
    speciallizationScreen: (context) => SpeciallizationScreen(),
    loginScreen: (context) => LoginScreen(),
    enterOtpScreen: (context) => EnterOtpScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    searchScreen: (context) => SearchScreen(),
    jobDetailsTabContainerScreen: (context) => JobDetailsTabContainerScreen(),
    applyJobScreen: (context) => ApplyJobScreen(),
    myProposalsTabContainerScreen: (context) => MyProposalsTabContainerScreen(),
    settingsScreen: (context) => SettingsScreen(),
    personalInfoScreen: (context) => PersonalInfoScreen(),
    experienceSettingScreen: (context) => ExperienceSettingScreen(),
    newPositionScreen: (context) => NewPositionScreen(),
    addNewEducationScreen: (context) => AddNewEducationScreen(),
    privacyScreen: (context) => PrivacyScreen(),
    languageScreen: (context) => LanguageScreen(),
    notificationsScreen: (context) => NotificationsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => SplashScreen()
  };
}
