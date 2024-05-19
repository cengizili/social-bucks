import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30.v),
            child: Container(
              margin: EdgeInsets.only(bottom: 5.v),
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Terms",
                    style: CustomTextStyles.titleMediumPrimaryBold_1,
                  ),
                  SizedBox(height: 11.v),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 307.h,
                      margin: EdgeInsets.only(right: 19.h),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleSmallBlack90087.copyWith(
                          height: 1.57,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 307.h,
                      margin: EdgeInsets.only(right: 19.h),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleSmallBlack90087.copyWith(
                          height: 1.57,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "Changes to the Service and/or Terms:",
                    style: CustomTextStyles.titleMediumPrimaryBold_1,
                  ),
                  SizedBox(height: 7.v),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 307.h,
                      margin: EdgeInsets.only(right: 19.h),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleSmallBlack90087.copyWith(
                          height: 1.57,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 307.h,
                      margin: EdgeInsets.only(right: 19.h),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleSmallBlack90087.copyWith(
                          height: 1.57,
                        ),
                      ),
                    ),
                  )
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
      height: 51.v,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 13.v,
          bottom: 14.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Legel and Policies",
      ),
    );
  }
}
