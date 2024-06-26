import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/core/utils/validation_functions.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/task_data.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/screens/task_details/base_task_details_page.dart';
import 'package:social_bucks/screens/task_details/task_instructions_widget.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/custom_elevated_button.dart';
import 'package:social_bucks/widgets/custom_text_form_field.dart';
import 'package:social_bucks/widgets/error_pop_up.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';


class TaskDetailsSubmit extends BaseTaskDetailsPage {
   TaskDetailsSubmit({Key? key});

  final formKey = GlobalKey<FormState>();   
  TextEditingController usernameController = TextEditingController(text: Session.instance.me.instagramUsername ?? "");
  bool isCopied = false;

  @override
  Future<void> onButtonPressed() async {
    await submission.writeRef.update({
      "status": "processing",
      "fakeStatus": "processing",
    });
    await Future.delayed(Duration(seconds: 2));
    super.onButtonPressed();
  }
  
  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 302.h,
          padding: EdgeInsets.symmetric(
            horizontal: 32.h,
            vertical: 28.v,
          ),
          decoration: AppDecoration.white.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 9.v),
              SizedBox(
                height: 89.v,
                width: 97.h,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVector,
                      height: 85.v,
                      width: 97.h,
                      alignment: Alignment.topCenter,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector80x79,
                      height: 80.v,
                      width: 79.h,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 5.h),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector68x46,
                      height: 68.v,
                      width: 46.h,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 1.v),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector38x6,
                      height: 38.v,
                      width: 6.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(
                        left: 17.h,
                        bottom: 2.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector42x17,
                      height: 42.v,
                      width: 17.h,
                      alignment: Alignment.bottomLeft,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector4x4,
                      height: 4.adaptSize,
                      width: 4.adaptSize,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(
                        left: 9.h,
                        bottom: 4.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector31x44,
                      height: 31.v,
                      width: 44.h,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 1.v),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgTelevision,
                      height: 11.v,
                      width: 38.h,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(
                        top: 9.v,
                        right: 2.h,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 31.v),
              LocaleText(
                "That's it!",
                style: CustomTextStyles.titleMediumPrimaryBold,
              ),
              SizedBox(height: 9.v),
              LocaleText(
                "You can submit your task now. It might take up to 24 hours to get an approval.",
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallBluegray400SemiBold,
              ),
              SizedBox(height: 19.v),
            ],
          ),
        )
      ],
    ),
    );
  }
}
