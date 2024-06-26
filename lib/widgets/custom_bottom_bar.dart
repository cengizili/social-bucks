import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/screens/payment_requests/payments_page.dart';
import 'package:social_bucks/screens/profile_page.dart';
import 'package:social_bucks/screens/submissions/submissions_page.dart';
import 'package:social_bucks/screens/tasks/tasks_page.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Tasks, Submissions, Payments, Profile }

extension BottomBarEnumX on BottomBarEnum {
  Widget get page {
    switch (this) {
      case BottomBarEnum.Tasks:
      return TasksPage();
      case BottomBarEnum.Payments:
      return PaymentsPage();
      case BottomBarEnum.Submissions:
      return SubmissionsPage();
      case BottomBarEnum.Profile:
      return ProfilePage();
    }
  }
}


class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "Home",
      type: BottomBarEnum.Tasks,
      route: AppRoutes.tasks, // Define your GetX route here
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMessage,
      activeIcon: ImageConstant.imgCheck,
      title: "Submissions",
      type: BottomBarEnum.Submissions,
      route: AppRoutes.submissions, // Define your GetX route here
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavSaved,
      activeIcon: ImageConstant.imgNavSaved,
      title: "Payment Requests",
      type: BottomBarEnum.Payments,
      route: AppRoutes.paymentRequests, // Define your GetX route here
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "Profile",
      type: BottomBarEnum.Profile,
      route: AppRoutes.profile, // Define your GetX route here
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onError,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -4,
            ),
          )
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  color: appTheme.gray500,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: LocaleText(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.labelLargeGray500_1.copyWith(
                      color: appTheme.gray500,
                    ),
                  ),
                )
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  color: theme.colorScheme.primary,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: LocaleText(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.labelLargePrimary_1.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                )
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          // Nav.toNamed(bottomMenuList[index].route); // Navigate to the route
          setState(() {});
          Get.toNamed(bottomMenuList[index].route);
          print(Get.currentRoute);
        },
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    required this.route,
  });

  String icon;
  String activeIcon;
  String? title;
  BottomBarEnum type;
  String route; // Add route property
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
