import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_switch.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key})
      : super(
          key: key,
        );

  bool isSelectedSwitch = false;

  bool isSelectedSwitch1 = false;

  bool isSelectedSwitch2 = false;

  bool isSelectedSwitch3 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Container(
          width: 327.h,
          margin: EdgeInsets.fromLTRB(24.h, 30.v, 24.h, 5.v),
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineGray300.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Messages Notifications",
                style: CustomTextStyles.labelLargeGray50001,
              ),
              SizedBox(height: 19.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.v),
                    child: Text(
                      "New Post",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  CustomSwitch(
                    value: isSelectedSwitch,
                    onChange: (value) {
                      isSelectedSwitch = value;
                    },
                  )
                ],
              ),
              SizedBox(height: 22.v),
              Divider(),
              SizedBox(height: 21.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.v),
                    child: Text(
                      "Interview Invited",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  CustomSwitch(
                    value: isSelectedSwitch1,
                    onChange: (value) {
                      isSelectedSwitch1 = value;
                    },
                  )
                ],
              ),
              SizedBox(height: 22.v),
              Divider(),
              SizedBox(height: 21.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Text(
                      "Message",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  CustomSwitch(
                    value: isSelectedSwitch2,
                    onChange: (value) {
                      isSelectedSwitch2 = value;
                    },
                  )
                ],
              ),
              SizedBox(height: 22.v),
              Divider(),
              SizedBox(height: 21.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.v),
                    child: Text(
                      "New Post Job",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  CustomSwitch(
                    value: isSelectedSwitch3,
                    onChange: (value) {
                      isSelectedSwitch3 = value;
                    },
                  )
                ],
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
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 13.v,
          bottom: 13.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Notifications",
      ),
    );
  }
}
