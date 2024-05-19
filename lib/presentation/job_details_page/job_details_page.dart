import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart'; // ignore_for_file: must_be_immutable

class JobDetailsPage extends StatefulWidget {
  const JobDetailsPage({Key? key})
      : super(
          key: key,
        );

  @override
  JobDetailsPageState createState() => JobDetailsPageState();
}

class JobDetailsPageState extends State<JobDetailsPage>
    with AutomaticKeepAliveClientMixin<JobDetailsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildScrollview(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollview(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 28.v),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.h),
                  child: Text(
                    "Job Description",
                    style: CustomTextStyles.titleMediumPrimaryBold_1,
                  ),
                ),
              ),
              SizedBox(height: 13.v),
              Container(
                width: 319.h,
                margin: EdgeInsets.only(
                  left: 31.h,
                  right: 24.h,
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec porttitor magna luctus tortor. Pretium malesuada lobortis consequat et mauris. \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nec porttitor magna luctus tortor. Pretium malesuada lobortis consequat et mauris. \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nec porttitor magna luctus tortor. Pretium malesuada lobortis consequat et mauris. ",
                  maxLines: 12,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallBluegray400.copyWith(
                    height: 1.57,
                  ),
                ),
              ),
              SizedBox(height: 17.v),
              Container(
                padding: EdgeInsets.all(24.h),
                decoration: AppDecoration.gradientGrayToGray,
                child: Column(
                  children: [
                    SizedBox(height: 20.v),
                    CustomElevatedButton(
                      text: "Apply Now",
                      onPressed: () {
                        onTapApplynow(context);
                      },
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /// Navigates to the applyJobScreen when the action is triggered.
  onTapApplynow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.applyJobScreen);
  }
}
