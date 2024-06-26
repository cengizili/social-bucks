import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/core/utils/validation_functions.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/submission_model.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/screens/home/bottom_appbar_controller.dart';
import 'package:social_bucks/services/browser_service.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/custom_elevated_button.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';



abstract class BaseTaskDetailsPage extends StatelessWidget {
   BaseTaskDetailsPage({Key? key})
      : super(
          key: key,
        );
        
  final String taskId = Get.arguments["id"];
  final routes = [AppRoutes.taskDetailsStart, AppRoutes.taskDetailsDo, AppRoutes.taskDetailsSubmit];
  TaskModel get taskModel => Session.instance.tasks.value.values.firstWhere((p0) => p0.id == taskId);
  SubmissionModel get submission => taskModel.submissions.entries.first.value;
  Future<void> onButtonPressed () async {
    goNextRoute();
  }

  void goNextRoute () async {
    if (Nav.currentRoute == AppRoutes.taskDetailsSubmit) {
      for (var i = 0; i < routes.length; i++) {
        Nav.back();
      }
      Get.put(BottomAppBarController()).changeIndex(1);
      await BrowserService.instance.init();
    }
    if (routes.contains(Nav.currentRoute)) {
      final index = routes.indexOf(Nav.currentRoute);
      Nav.toNamed(routes[index + 1], arguments: taskModel.toJson());
    }
  }

  String get buttonText {
    if (routes.indexOf(Nav.currentRoute) == 0)
    return "Start";
    if (routes.indexOf(Nav.currentRoute) == routes.length-1)
    return "Submit";
    
    return "Go to the link";
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 33.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildBody(context),
                CustomElevatedButton(
                  width: SizeUtils.width * 0.9,
                  text: buttonText,
                  onPressed: () async {
                    await onButtonPressed.call();
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context);

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        onTap:() => Nav.back(),
        margin: EdgeInsets.only(
          left: 24.h,
          top: 13.v,
          bottom: 13.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Task Details",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgComponent3,
          margin: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 13.v,
          ),
        )
      ],
    );
  }


}
