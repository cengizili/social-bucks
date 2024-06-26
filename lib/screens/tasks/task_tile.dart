import 'package:flutter/material.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart'; // ignore: must_be_immutable

class TaskContainer extends StatelessWidget {
  const TaskContainer({Key? key, required this.taskModel, this.isRecommended=false})
      : super(
          key: key,
        );
  
  final TaskModel taskModel;
  final bool isRecommended;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Nav.toNamed(AppRoutes.taskDetailsStart, arguments: taskModel.toJson()),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16.h),
          decoration: (isRecommended ? AppDecoration.fillPrimary : AppDecoration.fillWhiteA).copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          width: 273.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 96.v),
                child: CustomImageView(
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  fit: BoxFit.contain,
                  imagePath: taskModel.platform.asset,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.h,
                  top: 4.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.platform.displayName,
                      style: isRecommended ?
                      CustomTextStyles.titleSmallErrorContainer :
                      CustomTextStyles.titleSmallErrorContainer.copyWith(color: theme.primaryColor)                ),
                    SizedBox(height: 7.v),
                    Opacity(
                      opacity: 0.8,
                      child: LocaleText(
                        taskModel.taskType.displayName,
                        style: isRecommended ?
                         CustomTextStyles.labelLargeErrorContainerSemiBold :
                         CustomTextStyles.labelLargeErrorContainerSemiBold.copyWith(color: Colors.grey) ,
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        taskModel.client,
                        style: CustomTextStyles.labelLargeErrorContainer.copyWith(color: Colors.grey[600]),
                      ),
                    ),
                    SizedBox(height: 9.v),
                    Text(
                      "\$${taskModel.credits}",
                      style: isRecommended ?
                      CustomTextStyles.labelLargeErrorContainer_2 : 
                      CustomTextStyles.labelLargeErrorContainer_2.copyWith(color: Colors.grey[700]),
                    ),
                    SizedBox(height: 17.v),
                    SizedBox(
                      width: 180.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 6.v,
                            ),
                            decoration:
                                (isRecommended ?
                                 AppDecoration.fillOnSecondaryContainer : 
                                 AppDecoration.fillGray
                                 ).copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder16,
                            ),
                            child: Text(
                              "${taskModel.current}/${taskModel.quota}",
                              style: isRecommended ?
                               CustomTextStyles.labelLargeErrorContainer_1 : 
                               CustomTextStyles.labelLargeErrorContainer_1.copyWith(color: Colors.grey),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 6.v,
                            ),
                            decoration:
                                (isRecommended ?
                                 AppDecoration.fillOnSecondaryContainer : 
                                 AppDecoration.fillGray
                                 ).copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder16,
                            ),
                            child: LocaleText(
                              "${taskModel.dateCreated.untilNow.standard} ago",
                              style: isRecommended ?
                               CustomTextStyles.labelLargeErrorContainer_1 : 
                               CustomTextStyles.labelLargeErrorContainer_1.copyWith(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              if (!isRecommended)
              CustomImageView(
                height: 30.adaptSize,
                width: 30.adaptSize,
                imagePath: ImageConstant.imgNavSaved,
              )
            ],
          ),
        ),
      ),
    );
  }
}
