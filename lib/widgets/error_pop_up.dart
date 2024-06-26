import 'package:flutter/material.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../core/app_export.dart';
import 'custom_elevated_button.dart'; // ignore_for_file: must_be_immutable

class ErrorPopUp extends StatelessWidget {
  const ErrorPopUp({Key? key, required this.errorText})
      : super(
          key: key,
        );
  
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 302.h,
          padding: EdgeInsets.symmetric(
            horizontal: 32.h,
            vertical: 28.v,
          ),
          decoration: AppDecoration.white.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 9.v),
              Icon(Icons.error_outline_outlined, size: 80.adaptSize, color: theme.primaryColor,),
              SizedBox(height: 9.v),
              LocaleText(
                "Warning",
                style: CustomTextStyles.titleMediumPrimaryBold,
              ),
              SizedBox(height: 15.v),
              LocaleText(
                errorText,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallBluegray400SemiBold,
              ),
              SizedBox(height: 19.v),
              CustomElevatedButton(
                height: 54.v,
                width: 127.h,
                onPressed: () async => Nav.back(),
                text: "I understand",
                buttonTextStyle:
                    CustomTextStyles.titleSmallErrorContainerSemiBold,
              )
            ],
          ),
        )
      ],
    );
  }
}
