import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:social_bucks/widgets/custom_elevated_button.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import 'package:uuid/uuid.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomOutlinedButton extends BaseButton {
  CustomOutlinedButton(
      {Key? key,
      this.decoration,
      this.leftIcon,
      this.rightIcon,
      this.label,
      super.onPressed,
      ButtonStyle? buttonStyle,
      TextStyle? buttonTextStyle,
      bool? isDisabled,
      Alignment? alignment,
      double? height,
      double? width,
      EdgeInsets? margin,
      required String text})
      : super(
          text: text,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          alignment: alignment,
          width: width,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  final Widget? label;

  final controller = Get.put(ButtonController(), tag: Uuid().v4());

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildOutlinedButtonWidget)
        : buildOutlinedButtonWidget;
  }

  Widget get buildOutlinedButtonWidget => Container(
        height: this.height ?? 56.v,
        width: this.width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: OutlinedButton(
          style: buttonStyle,
          onPressed:() async {
            if (controller.isLoading.value)
            return ;
            controller.isLoading.value = true;
            await onPressed?.call();
            controller.isLoading.value = false;
          },
          child: Obx(() => Visibility(
            visible: !controller.isLoading.value,
            replacement: Center(
              child: CircularProgressIndicator(
                color: theme.primaryColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leftIcon ?? const SizedBox.shrink(),
                LocaleText(
                  text,
                  style: buttonTextStyle ??
                      CustomTextStyles.titleMediumPrimarySemiBold,
                ),
                rightIcon ?? const SizedBox.shrink()
              ],
            ),
          ),)
        ),
      );
}
