import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:social_bucks/models/extensions.dart';
import 'package:social_bucks/screens/tasks/task_tile.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_circleimage.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_subtitle_two.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_search_view.dart';


class TasksPage extends StatelessWidget {
  TasksPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30.v),
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildColumnmediumlab(context),
                  SizedBox(height: 22.v),
                  _buildRecentjobs(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      height: 100.v,
      leadingWidth: 74.h,
      leading: Container(
          width: 89.adaptSize,
          height: 89.adaptSize,
          padding: EdgeInsets.only(left: 10.h),
          child: RandomAvatar(Session.instance.me.uid),
          decoration: BoxDecoration(
            border: Border.all(width: 5.adaptSize, color: Colors.transparent),
            borderRadius: BorderRadius.circular(
            100.h,
          ),
          ),
        ),
      title: Padding(
        padding: EdgeInsets.only(left: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarSubtitle(
              text: "Hi, Welcome Back! 👋",
            ),
            SizedBox(height: 9.v),
            AppbarSubtitleTwo(
              text: "Complete tasks and earn money",
              margin: EdgeInsets.only(right: 33.h),
            )
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgBell,
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 13.v,
          ),
          onTap:() => Nav.toNamed(AppRoutes.settings),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildColumnmediumlab(BuildContext context) {
    return Obx(() => Visibility(
      visible: Session.instance.allowedTasks.recommendations.length > 0,
      child: Padding(
      padding: EdgeInsets.only(left: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocaleText(
            "Recommendation",
            style: CustomTextStyles.titleMediumPrimarySemiBold18,
          ),
          SizedBox(height: 17.v),
          SizedBox(
            height: 200.v,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 16.h,
                );
              },
              itemCount: Session.instance.allowedTasks.recommendations.length,
              itemBuilder: (context, index) {
                return TaskContainer(taskModel: Session.instance.allowedTasks.recommendations.dateSorted.values.elementAt(index), isRecommended: true,);
              },
            ),
          )
        ],
      ),
    )));
  }

  /// Section Widget
  Widget _buildRecentjobs(BuildContext context) {
    return Obx(() => Visibility(
      visible: Session.instance.allowedTasks.length > 0,
      child: Padding(
        padding: EdgeInsets.only(left: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocaleText(
              "Recent Tasks",
              style: CustomTextStyles.titleMediumPrimarySemiBold,
            ),
            SizedBox(height: 15.v),
            Padding(
              padding: EdgeInsets.only(right: 24.h),
              child: ListView.separated(
                separatorBuilder:(context, index) => SizedBox(height: 10.v,),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Session.instance.allowedTasks.length,
                itemBuilder: (context, index) {
                  return TaskContainer(taskModel: Session.instance.allowedTasks.dateSorted.values.elementAt(index),);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
