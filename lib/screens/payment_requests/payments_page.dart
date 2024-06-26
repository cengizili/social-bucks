import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/extensions.dart';
import 'package:social_bucks/screens/payment_requests/payments_section.dart';
import 'package:social_bucks/screens/submissions/submissions_section.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key})
      : super(
          key: key,
        );

  @override
  PaymentsPageState createState() =>
      PaymentsPageState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PaymentsPageState
    extends State<PaymentsPage> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.v),
              Container(
                height: 44.v,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 24.h),
                child: TabBar(
                  controller: tabviewController,
                  labelPadding: EdgeInsets.zero,
                  labelColor: appTheme.whiteA700,
                  labelStyle: TextStyle(
                    fontSize: 12.fSize,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelColor:
                      appTheme.blueGray400,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.fSize,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(
                      12.h,
                    ),
                    border: Border.all(
                      color: appTheme.gray300,
                      width: 1.h,
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: LocaleText(
                        "Approved",
                      ),
                    ),
                    Tab(
                      child: LocaleText(
                        "Processing",
                      ),
                    ),
                    Tab(
                      child: LocaleText(
                        "Rejected",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 500.v,
                child: TabBarView(
                  controller: tabviewController,
                  children: [
                    PaymentsSection(status: Status.approved,),
                    PaymentsSection(status: Status.processing,),
                    PaymentsSection(status: Status.rejected,),],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48.h,
      centerTitle: true,
      title: AppbarTitle(
        text: "Payment Requests",
      ),
    );
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImageone(BuildContext context) {
  }
}
