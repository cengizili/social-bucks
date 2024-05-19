import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart'; // ignore: must_be_immutable

class MyProposalsItemWidget extends StatelessWidget {
  const MyProposalsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgFavorite,
          height: 48.adaptSize,
          width: 48.adaptSize,
          margin: EdgeInsets.only(bottom: 42.v),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            top: 4.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Senior UI/UX Designer",
                style: CustomTextStyles.titleSmallBold,
              ),
              SizedBox(height: 6.v),
              Text(
                "Shell",
                style: CustomTextStyles.labelLargeGray500,
              ),
              SizedBox(height: 17.v),
              CustomElevatedButton(
                height: 28.v,
                width: 81.h,
                text: "Opened",
                buttonStyle: CustomButtonStyles.fillGreen,
                buttonTextStyle: CustomTextStyles.bodySmallGreen600,
              )
            ],
          ),
        )
      ],
    );
  }
}
