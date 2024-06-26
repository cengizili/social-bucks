import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/core/app_export.dart';
import 'package:social_bucks/core/utils/image_constant.dart';
import 'package:social_bucks/routes/app_routes.dart';
import 'package:social_bucks/screens/home/bottom_appbar_controller.dart';
import 'package:social_bucks/screens/payment_requests/payments_page.dart';
import 'package:social_bucks/screens/profile_page.dart';
import 'package:social_bucks/screens/submissions/submissions_page.dart';
import 'package:social_bucks/screens/tasks/tasks_page.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/theme/theme_helper.dart';
import 'package:social_bucks/widgets/locale_text.dart';

class CustomBottomBar extends StatelessWidget {
  final Function(BottomBarEnum)? onChanged;

  CustomBottomBar({this.onChanged});

  final BottomAppBarController controller = Get.put(BottomAppBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: controller.selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(controller.bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: controller.bottomMenuList[index].icon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    color: appTheme.gray500,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: LocaleText(
                      controller.bottomMenuList[index].title ?? "",
                      style: CustomTextStyles.labelLargeGray500_1.copyWith(
                        color: appTheme.gray500,
                      ),
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: controller.bottomMenuList[index].activeIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    color: theme.colorScheme.primary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: LocaleText(
                      controller.bottomMenuList[index].title ?? "",
                      style: CustomTextStyles.labelLargePrimary_1.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
      );
    });
  }
}
