import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import 'package:uuid/uuid.dart';
import '../core/app_export.dart';
import '../theme/custom_button_style.dart';
import 'base_button.dart';

class ButtonController extends GetxController {
  RxBool isLoading = false.obs;
}

class CustomElevatedButton extends BaseButton {
  CustomElevatedButton(
      {Key? key,
      this.decoration,
      this.leftIcon,
      this.rightIcon,
      this.indicator,
      super.onPressed,
      EdgeInsets? margin,
      ButtonStyle? buttonStyle,
      Alignment? alignment,
      TextStyle? buttonTextStyle,
      bool? isDisabled,
      double? height,
      double? width,
      required String text})
      : super(
          text: text,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? indicator;

  final Widget? leftIcon;

  final Widget? rightIcon;

  final controller = Get.put(ButtonController(), tag: Uuid().v4());

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget)
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: this.height ?? 56.v,
        width: this.width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed:() async {
            if (controller.isLoading.value)
            return ;
            controller.isLoading.value = true;
            await onPressed?.call();
            controller.isLoading.value = false;
          },
          child: Obx(() => Visibility(
            visible: controller.isLoading.value,
            child: Center(
              child: indicator ?? CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            replacement: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              LocaleText(
                text,
                style: buttonTextStyle ??
                    CustomTextStyles.titleMediumErrorContainerSemiBold,
              ),
              rightIcon ?? const SizedBox.shrink()
            ],
          ))),
        ),
      );
}
