import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/screens/task_details/base_task_details_page.dart';
import 'package:social_bucks/services/firebase_service.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/custom_elevated_button.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';


class TaskDetailsStart extends BaseTaskDetailsPage {
   TaskDetailsStart({Key? key});

   @override
  Future<void> onButtonPressed() async {
    if (Session.instance.submissions.value.where((p0) => p0.taskId == taskModel.id).isEmpty)
    await FirebaseService.createSubmission(taskModel);
    super.onButtonPressed();
  }
        
  
  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Obx(() => _buildColumncardanoon(context),),
        SizedBox(height: 21.v),
        Obx(() => _buildJobdetail(context)),
        SizedBox(height: 21.v),
      ],
    );
  }

  Widget _buildChip(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 6.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Obx(() => LocaleText(
        taskModel.dateCreated.untilNow.standard + " ago",
        style: TextStyle(
          color: appTheme.blueGray400,
          fontSize: 12.fSize,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w400,
        ),
      ),),
      selected: false,
      backgroundColor: appTheme.gray100,
      selectedColor: appTheme.green600,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          8.h,
        ),
      ),
      onSelected: (value) {},
    );
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
  Widget _buildColumncardanoon(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
          left: 27.h,
          right: 21.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 71.h,
          vertical: 23.v,
        ),
        decoration: AppDecoration.outlineGray300.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 79.adaptSize,
              width: 79.adaptSize,
              padding: EdgeInsets.all(19.h),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder39,
              ),
              child: CustomImageView(
                imagePath: taskModel.platform.asset,
                height: 40.adaptSize,
                width: 40.adaptSize,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16.v),
            Text(
              taskModel.platform.displayName,
              style: CustomTextStyles.titleSmallBold,
            ),
            SizedBox(height: 7.v),
            LocaleText(
              taskModel.taskType.displayName,
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 12.v),
            _buildChip(context)
          ],
        ),
      ),
    );
  }

  Widget _buildIconTile (String imagePath, String title, String subtitle) {
    return SizedBox(
      width: 76.h,
      child: Column(
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 48.adaptSize,
            width: 48.adaptSize,
          ),
          SizedBox(height: 9.v),
          LocaleText(
            title,
            style: CustomTextStyles.labelLargeGray500_1,
          ),
          SizedBox(height: 9.v),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: CustomTextStyles.titleSmallSemiBold,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildJobdetail(BuildContext context) {
    final items = [
      (ImageConstant.imgFloatingIcon, "Credits", "\$${taskModel.credits}"),
      (ImageConstant.imgPlay, "Client", "${taskModel.client}"),
      (ImageConstant.imgUser48x48, "Submissions", "${taskModel.current}/${taskModel.quota}")
    ];
    return SizedBox(
      height: 150.v,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 0.h,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 54.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildIconTile(
            items[index].$1, items[index].$2, items[index].$3, 
          );
        },
      ),
    );
  }

}
