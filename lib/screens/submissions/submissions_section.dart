import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/submission_model.dart';
import 'package:social_bucks/screens/submissions/submission_tile.dart';
import 'package:social_bucks/services/session.dart';
import '../../core/app_export.dart';

class SubmissionSection extends StatefulWidget {
  const SubmissionSection({Key? key, required this.status})
      : super(
          key: key,
        );
  
  final Status status;

  @override
  SubmissionSectionState createState() => SubmissionSectionState();
}

class SubmissionSectionState extends State<SubmissionSection>
    with AutomaticKeepAliveClientMixin<SubmissionSection> {

  List<SubmissionModel> get submissions => Session.instance.submissions.value.values.where((element) => element.fakeStatus == widget.status).toList();
  
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
                height: 10.v,
                thickness: 1.v,
                color: appTheme.gray300,
              ),
            ),
          );
        },
        itemCount: submissions.length,
        itemBuilder: (context, index) {
          return SubmissionTile(submissionModel: submissions.elementAt(index),);
        },
      )),
    );
  }
}
