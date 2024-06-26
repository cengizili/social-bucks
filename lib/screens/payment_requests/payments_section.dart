
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/payment_request.dart';
import 'package:social_bucks/models/submission_model.dart';
import 'package:social_bucks/screens/payment_requests/payment_tile.dart';
import 'package:social_bucks/screens/submissions/submission_tile.dart';
import 'package:social_bucks/services/session.dart';
import '../../core/app_export.dart';

class PaymentsSection extends StatefulWidget {
  const PaymentsSection({Key? key, required this.status})
      : super(
          key: key,
        );
  
  final Status status;

  @override
  PaymentsSectionState createState() => PaymentsSectionState();
}

class PaymentsSectionState extends State<PaymentsSection>
    with AutomaticKeepAliveClientMixin<PaymentsSection> {

  List<PaymentRequestModel> get paymentRequests => Session.instance.paymentRequests.value.values.where((element) => element.status == widget.status).toList();
  
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.background,
          child: Column(
            children: [SizedBox(height: 24.v), _buildGeneral(context)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGeneral(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Obx(() => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.5.v),
            child: SizedBox(
              width: 323.h,
              child: Divider(
                height: 1.v,
                thickness: 1.v,
                color: appTheme.gray300,
              ),
            ),
          );
        },
        itemCount: paymentRequests.length,
        itemBuilder: (context, index) {
          return PaymentTile(paymentRequestModel: paymentRequests.elementAt(index),);
        },
      )),
    );
  }
}
