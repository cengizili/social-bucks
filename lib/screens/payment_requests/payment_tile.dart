
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/payment_request.dart';
import 'package:social_bucks/models/submission_model.dart';
import 'package:social_bucks/theme/custom_button_style.dart';
import 'package:social_bucks/widgets/custom_elevated_button.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class PaymentTile extends StatelessWidget {
  const PaymentTile({Key? key, required this.paymentRequestModel})
      : super(
          key: key,
        );

  final PaymentRequestModel paymentRequestModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: paymentRequestModel.paymentOption.asset,
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
                    paymentRequestModel.paymentOption.asset,
                    style: CustomTextStyles.titleSmallBold,
                  ),
                  SizedBox(height: 7.v),
                  Text(
                    "\$${paymentRequestModel.amount}",
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
              child: LocaleText(
                paymentRequestModel.dateCreated.untilNow.standard + " ago",
                style: CustomTextStyles.labelLargeGray500_1,
              ),
            )
          ],
        ),
        SizedBox(height: 11.v),
        Padding(
          padding: EdgeInsets.only(left: 40.h,),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.adaptSize))),
            color: appTheme.green50,
            child: Container(
              height: 28.v,
              width: 81.h,
              child: Center(
                child: LocaleText(paymentRequestModel.status.name.toUpperCase(), style: CustomTextStyles.bodySmallGreen600,),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
