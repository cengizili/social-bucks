import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart'; // ignore_for_file: must_be_immutable

class SavedDetailJobPage extends StatefulWidget {
  const SavedDetailJobPage({Key? key})
      : super(
          key: key,
        );

  @override
  SavedDetailJobPageState createState() => SavedDetailJobPageState();
}

class SavedDetailJobPageState extends State<SavedDetailJobPage>
    with AutomaticKeepAliveClientMixin<SavedDetailJobPage> {
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Description",
                  style: CustomTextStyles.titleMediumPrimaryBold_1,
                ),
                SizedBox(height: 13.v),
                Container(
                  width: 319.h,
                  margin: EdgeInsets.only(left: 7.h),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec porttitor magna luctus tortor. Pretium malesuada lobortis consequat et mauris. \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nec porttitor magna luctus tortor. Pretium malesuada lobortis consequat et mauris. \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nec porttitor magna luctus tortor. Pretium malesuada lobortis consequat et mauris. ",
                    maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleSmallBluegray400.copyWith(
                      height: 1.57,
                    ),
                  ),
                ),
                SizedBox(height: 39.v),
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
      ),
    );
  }

  /// Navigates to the applyJobScreen when the action is triggered.
  onTapApplynow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.applyJobScreen);
  }
}
