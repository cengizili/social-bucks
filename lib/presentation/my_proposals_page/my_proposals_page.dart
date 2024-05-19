import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'widgets/my_proposals_item_widget.dart'; // ignore_for_file: must_be_immutable

class MyProposalsPage extends StatefulWidget {
  const MyProposalsPage({Key? key})
      : super(
          key: key,
        );

  @override
  MyProposalsPageState createState() => MyProposalsPageState();
}

class MyProposalsPageState extends State<MyProposalsPage>
    with AutomaticKeepAliveClientMixin<MyProposalsPage> {
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
            children: [SizedBox(height: 28.v), _buildColumnapplicati(context)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnapplicati(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Application Status (3)",
            style: CustomTextStyles.titleMediumPrimaryBold_1,
          ),
          SizedBox(height: 22.v),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.5.v),
                child: SizedBox(
                  width: 327.h,
                  child: Divider(
                    height: 1.v,
                    thickness: 1.v,
                    color: appTheme.gray300,
                  ),
                ),
              );
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return MyProposalsItemWidget();
            },
          )
        ],
      ),
    );
  }
}
