import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class GenderController extends GetxController {
  RxInt genderType = 0.obs;
  RxBool isError = false.obs;
}

class GenderPage extends StatelessWidget {
   GenderPage({Key? key})
      : super(
          key: key,
        );

  final controller = Get.put(GenderController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 34.v,
          ),
          child: Column(
            children: [
              LocaleText(
                "Choose Your Gender",
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 7.v),
              SizedBox(
                width: 209.h,
                child: Obx(() => LocaleText(
                  controller.isError.value ? "Please choose your gender before continue" : "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleSmallBluegray400.copyWith(
                    height: 1.57,
                    color: Colors.red
                  ),
                )),
              ),
              SizedBox(height: 37.v),
              _buildJobtype(context)
            ],
          ),
        ),
        bottomNavigationBar: _buildContinue(context),
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
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgComponent3,
          margin: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 13.v,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildJobtype(BuildContext context) {
    final items = [
      (ImageConstant.male, "Male", "Please select your gender for us to provide you a better experience."),
      (ImageConstant.female, "Female", "Please select your gender for us to provide you a better experience.")
    ];
    return SizedBox(
      height: 229.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 15.h,
          );
        },
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildGender(items[index].$1, items[index].$2, items[index].$3);
        },
      ),
    );
  }

  Widget _buildGender(String imagePath, String gender, String genderTitle) {
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(
            horizontal: 17.h,
            vertical: 20.v,
          ),
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder24,
            border: Border.all(color: (gender == "Male" && controller.genderType.value == 1) || (gender == "Female" && controller.genderType.value == 2) ? Colors.green : theme.primaryColor)
          ),
          width: 156.h,
          child: InkWell(
            onTap: () => controller.genderType.value = gender == "Male" ? 1 : 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 2.v),
                CustomImageView(
                  imagePath: imagePath,
                  height: 64.adaptSize,
                  width: 64.adaptSize,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 29.v),
                LocaleText(
                  gender,
                  style: CustomTextStyles.titleMediumPrimarySemiBold,
                ),
                SizedBox(height: 9.v),
                SizedBox(
                  width: 120.h,
                  child: LocaleText(
                    genderTitle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.labelLargeGray500_1.copyWith(
                      height: 1.67,
                    ),
                  ),
                )
              ],
            ),
          )
        ));
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
      text: "Continue",
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 55.v,
      ),
      onPressed: () async {
        onTapContinue(context);
      },
    );
  }

  /// Navigates to the speciallizationScreen when the action is triggered.
  onTapContinue(BuildContext context) async {
    if (controller.genderType == null) {
        controller.isError.value = true;
    }
    else {
      await Session.instance.me.writeRef.child("gender").set(controller.genderType == 0 ? "Male" : "Female");
      Nav.toNamed(AppRoutes.home);
    }
  }
}
