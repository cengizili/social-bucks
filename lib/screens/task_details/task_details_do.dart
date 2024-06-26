import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/core/utils/url_constants.dart';
import 'package:social_bucks/core/utils/validation_functions.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/task_data.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/screens/task_details/base_task_details_page.dart';
import 'package:social_bucks/screens/task_details/task_instructions_widget.dart';
import 'package:social_bucks/services/browser_service.dart';
import 'package:social_bucks/services/html_helpers.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/services/selenium_service.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/custom_elevated_button.dart';
import 'package:social_bucks/widgets/custom_text_form_field.dart';
import 'package:social_bucks/widgets/error_pop_up.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';


class TaskDetailsDo extends BaseTaskDetailsPage {
   TaskDetailsDo({Key? key});

  final formKey = GlobalKey<FormState>();   
  TextEditingController usernameController = TextEditingController(text: Session.instance.me.instagramUsername ?? "");
  bool isCopied = false;

  @override
  Future<void> onButtonPressed() async {
    if (taskModel.platform == TaskPlatform.instagram) {
      if (formKey.currentState!.validate()){
        await Session.instance.me.writeRef.child("instagramUsername").set(usernameController.text);
        await taskModel.launch();
        await Future.delayed(Duration(milliseconds: 500));
        super.onButtonPressed();
      }
    }
    else if (taskModel.platform == TaskPlatform.play) {
      if (isCopied) {
        if (DateTime.now().toUtc().difference(submission.dateCreated) > Duration(minutes: 1)){
          await taskModel.launch();
          super.onButtonPressed();
        }
        else {
          Get.dialog(ErrorPopUp(errorText: "Please go back to ${taskModel.client} and use the application for at least a minute!"), barrierDismissible: false);
        }
      }
      else {
        Get.dialog(ErrorPopUp(errorText: "Please copy the review before continue"), barrierDismissible: false);
      }
    }
    else if (taskModel.platform == TaskPlatform.maps) {
      if (isCopied) {
        Nav.toNamed(AppRoutes.webView, arguments: {"initialUrl": taskModel.url});
        await BrowserService.instance.ensureSignedIn()
        .then((value) async => 
         await BrowserService.instance.ensureLocalGuide()
        .then((value) async {
          BrowserService.instance.reviewContent = submission.reviewContent!;
          await BrowserService.instance.mapsTaskHandler(taskModel.url);
        }
        ));
        super.onButtonPressed();
      }
      else {
        Get.dialog(ErrorPopUp(errorText: "Please copy the review before continue"), barrierDismissible: false);
      }
    }
  }
  
  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (taskModel.platform == TaskPlatform.instagram)
          _buildTextField()
          else
          _buildReviewSection(context),
          SizedBox(height: 21.v),
          SizedBox(
            width: 300.h,
            child: InstructionWidget(instructions: taskData[taskModel.platform.name+"_"+taskModel.taskType.name] as Map<String, dynamic>,)),
          SizedBox(height: 21.v),
        ],
      ),
    );
  }

  Widget _buildTextField () {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: CustomTextFormField(
          borderDecoration: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          hintText: "Enter your username",
          controller: usernameController,
          validator: (value) => isValidInstagramUsername(value ?? "") ? null : "Invalid username",
          prefix: Icon(Icons.person_2_outlined),
          suffix: Padding(
            padding: EdgeInsets.all(12.adaptSize),
            child: Container(
              width: 5.h,
              height: 5.v,
              child: Image.asset(taskModel.platform.asset,)),
          ),
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context) {
    bool isSelected = false;
    return StatefulBuilder(builder: (context, setState) {
      return RawChip(
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Icon(Icons.copy, size: 18, color: isSelected ? appTheme.greenA700 : null,),
        selected: isSelected,
        backgroundColor: appTheme.gray100,
        selectedColor: appTheme.gray100,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: isSelected ? appTheme.greenA700 : Colors.black),
          borderRadius: BorderRadius.circular(
            8.h,
          ),
        ),
        onSelected: (value) async {
          await Clipboard.setData(ClipboardData(text: submission.reviewContent ?? ""));
          setState.call((){
            isSelected = submission.reviewContent != null && true;
            isCopied = submission.reviewContent != null && true;
          });
        },
      );
    },);
  }

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

  /// Section Widget
  Widget _buildReviewSection(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 180.v,
        margin: EdgeInsets.only(
          left: 27.h,
          right: 21.h,
        ),
        decoration: AppDecoration.outlineGray300.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Stack(
          children: [
            Obx(() => Visibility(
              visible: submission.reviewContent == null,
              child: Center(
                child: CircularProgressIndicator(),
              ),
              replacement: Container(
              padding: EdgeInsets.fromLTRB(
                  15.h, 
                  15.v,
                  40.h,
                  15.v
                ),
                width: 400.h,
                child: Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(
                      submission.reviewContent ?? "",
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                                ),
                ),
              ),
            )),
            Positioned(
              right: 0,
              bottom: 0,
              child: _buildChip(context))
          ],
        )
      ),
    );
  }
}
