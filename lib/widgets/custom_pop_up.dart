import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/core/utils/image_constant.dart';
import 'package:social_bucks/services/event_service.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart'; // ignore_for_file: must_be_immutable

class AskPopUp extends CustomPopUpDialog {
  AskPopUp({
    required super.subtitle, 
    super.title = "Are You Sure?", 
    super.titleWidget = const QuestionMark(), 
    super.leftText = "Cancel", 
    super.onLeft, 
    required super.onRight, 
    required super.rightText}){
  }

}

class GenderPopUp extends CustomPopUpDialog {
  GenderPopUp({
    super.subtitle = "Please select your gender to continue", 
    super.title = "Choose Your Gender", 
    super.titleWidget = const CustomImageView(imagePath: "assets/images/genders.png",), 
    super.leftText = "Male", 
    super.onLeft, 
    super.onRight, 
    super.identicalButtons = true,
    super.rightText = "Female"}){
      onLeft = () async {
        Session.instance.me.gender = "Male";
        await Session.instance.me.updateDB();
        EventService.logUserCreated();
      };
      onRight = () async {
        Session.instance.me.gender = "Female";
        await Session.instance.me.updateDB();
        EventService.logUserCreated();
      };
  }

}

class CustomPopUpDialog extends StatelessWidget {
   CustomPopUpDialog({Key? key, 
   required this.subtitle,
   required this.title,
   required this.titleWidget,
   required this.leftText,
   this.identicalButtons = true,
    this.onLeft,
    this.onRight,
   required this.rightText,})
      : super(
          key: key,
        );
  
  final String title;
  final String leftText;
  final String rightText;
  final String subtitle;
  final Widget titleWidget;
   Future<void> Function()? onRight;
   Future<void> Function()? onLeft;
   final bool identicalButtons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SingleChildScrollView(
          child: _buildPopup(context),
        )
      ],
    ),
    );
  }

  /// Section Widget
  Widget _buildPopup(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 36.h,
        right: 36.h,
        bottom: 233.v,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 40.v,
      ),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 9.v),
          SizedBox(
            height: 82.adaptSize,
            width: 82.adaptSize,
            child: titleWidget,
          ),
          SizedBox(height: 35.v),
          LocaleText(
            title,
            style: CustomTextStyles.titleMediumPrimaryBold,
          ),
          SizedBox(height: 8.v),
          Container(
            width: 229.h,
            margin: EdgeInsets.only(
              left: 6.h,
              right: 5.h,
            ),
            child: LocaleText(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleSmallBluegray400SemiBold.copyWith(
                height: 1.57,
              ),
            ),
          ),
          SizedBox(height: 21.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  height: 46.v,
                  text: leftText,
                  margin: EdgeInsets.only(right: 6.h),
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL20,
                  buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
                  onPressed:() async {
                    if (onLeft != null){
                      await onLeft?.call();
                    }
                    Nav.back();
                  },
                ),
              ),
              if (identicalButtons)
              Expanded(
                child: CustomOutlinedButton(
                  height: 46.v,
                  text: rightText,
                  margin: EdgeInsets.only(right: 6.h),
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL20,
                  buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
                  onPressed:() async {
                    if (onRight != null){
                      await onRight?.call();
                    }
                    Nav.back();
                  },
                ),
              )
              else
              Expanded(
                child: CustomOutlinedButton(
                  height: 46.v,
                  text: rightText,
                  margin: EdgeInsets.only(left: 6.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallErrorContainerSemiBold,
                  onPressed:() async {
                    if (onRight != null){
                      await onRight?.call();
                    }
                    Nav.back();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapCancel(BuildContext context) {
    Get.back();
  }
}

class QuestionMark extends StatelessWidget {
  const QuestionMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.h),
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgProfileOnprimary,
              height: 31.v,
              width: 24.h,
            ),
            SizedBox(height: 3.v),
            CustomImageView(
              imagePath: ImageConstant.imgPlayOnprimary,
              height: 6.adaptSize,
              width: 6.adaptSize,
            )
          ],
        ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgContrast,
          height: 82.adaptSize,
          width: 82.adaptSize,
          alignment: Alignment.center,
        )
      ],
    );
  }
}
