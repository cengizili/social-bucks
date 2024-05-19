import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart'; // ignore: must_be_immutable

class SliderapplicatiItemWidget extends StatelessWidget {
  const SliderapplicatiItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 41.h,
          vertical: 32.v,
        ),
        decoration: AppDecoration.white.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 214.h,
              margin: EdgeInsets.symmetric(horizontal: 14.h),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Application surely viewed by ",
                      style: theme.textTheme.headlineSmall,
                    ),
                    TextSpan(
                      text: "each company",
                      style: theme.textTheme.headlineSmall,
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 14.v),
            SizedBox(
              width: 243.h,
              child: Text(
                "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallGray500SemiBold.copyWith(
                  height: 1.57,
                ),
              ),
            ),
            SizedBox(height: 69.v),
            CustomElevatedButton(
              width: 156.h,
              text: "Get Started",
            )
          ],
        ),
      ),
    );
  }
}
