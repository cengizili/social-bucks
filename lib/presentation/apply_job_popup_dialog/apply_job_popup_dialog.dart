import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart'; // ignore_for_file: must_be_immutable

class ApplyJobPopupDialog extends StatelessWidget {
  const ApplyJobPopupDialog({Key? key})
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
              SizedBox(
                height: 89.v,
                width: 97.h,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVector,
                      height: 85.v,
                      width: 97.h,
                      alignment: Alignment.topCenter,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector80x79,
                      height: 80.v,
                      width: 79.h,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 5.h),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector68x46,
                      height: 68.v,
                      width: 46.h,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 1.v),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector38x6,
                      height: 38.v,
                      width: 6.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(
                        left: 17.h,
                        bottom: 2.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector42x17,
                      height: 42.v,
                      width: 17.h,
                      alignment: Alignment.bottomLeft,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector4x4,
                      height: 4.adaptSize,
                      width: 4.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(
                        left: 9.h,
                        bottom: 4.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector31x44,
                      height: 31.v,
                      width: 44.h,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 1.v),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgTelevision,
                      height: 11.v,
                      width: 38.h,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(
                        top: 9.v,
                        right: 2.h,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 31.v),
              Text(
                "Success",
                style: CustomTextStyles.titleMediumPrimaryBold,
              ),
              SizedBox(height: 9.v),
              Text(
                "Your Application is succesfully sent",
                style: CustomTextStyles.titleSmallBluegray400SemiBold,
              ),
              SizedBox(height: 19.v),
              CustomElevatedButton(
                height: 54.v,
                width: 127.h,
                text: "Continue",
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
