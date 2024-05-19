import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class ListenglishukItemWidget extends StatelessWidget {
  const ListenglishukItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 5.v,
            bottom: 14.v,
          ),
          child: Text(
            "English (UK)",
            style: CustomTextStyles.titleMediumGray900,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgCheckmarkGreenA700,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.only(bottom: 17.v),
        )
      ],
    );
  }
}
