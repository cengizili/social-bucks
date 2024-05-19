import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class GeneralItemWidget extends StatelessWidget {
  const GeneralItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgGroup162903,
              height: 32.adaptSize,
              width: 32.adaptSize,
              margin: EdgeInsets.only(bottom: 13.v),
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
                    "Junior UI Designer ",
                    style: CustomTextStyles.titleSmallBold,
                  ),
                  SizedBox(height: 7.v),
                  Text(
                    "Shopee Sg",
                    style: theme.textTheme.labelLarge,
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 4.v,
                bottom: 24.v,
              ),
              child: Text(
                "32 Min ago",
                style: CustomTextStyles.labelLargeGray500_1,
              ),
            )
          ],
        ),
        SizedBox(height: 11.v),
        Container(
          width: 233.h,
          margin: EdgeInsets.only(
            left: 44.h,
            right: 50.h,
          ),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.labelLargePrimary_1.copyWith(
              height: 1.67,
            ),
          ),
        )
      ],
    );
  }
}
