import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart'; // ignore_for_file: must_be_immutable

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 331.h,
          padding: EdgeInsets.symmetric(
            horizontal: 25.h,
            vertical: 39.v,
          ),
          decoration: AppDecoration.fillWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              SizedBox(
                width: 279.h,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "I agree to the ",
                        style: CustomTextStyles.titleMediumGray500SemiBold,
                      ),
                      TextSpan(
                        text: "Terms of Service",
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                      TextSpan(
                        text: " and ",
                        style: CustomTextStyles.titleMediumGray500SemiBold,
                      ),
                      TextSpan(
                        text: "Conditions of Use",
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                      TextSpan(
                        text:
                            " including consent to electronic communications and I affirm that the information provided is my own.",
                        style: CustomTextStyles.titleMediumGray500SemiBold,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 17.v),
              CustomElevatedButton(
                height: 54.v,
                width: 181.h,
                text: "Agree and continue",
                buttonTextStyle:
                    CustomTextStyles.titleSmallErrorContainerSemiBold,
                onPressed: () {
                  onTapAgreeand(context);
                },
              ),
              SizedBox(height: 24.v),
              Text(
                "Disgree",
                style: CustomTextStyles.titleSmallOnPrimary,
              )
            ],
          ),
        )
      ],
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapAgreeand(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }
}
