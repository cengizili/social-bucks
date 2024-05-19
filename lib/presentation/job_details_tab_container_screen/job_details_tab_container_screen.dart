import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../saved_detail_job_page/saved_detail_job_page.dart';
import 'widgets/chipviewfulltim_item_widget.dart';
import 'widgets/jobdetail_item_widget.dart';

class JobDetailsTabContainerScreen extends StatefulWidget {
  const JobDetailsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  JobDetailsTabContainerScreenState createState() =>
      JobDetailsTabContainerScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class JobDetailsTabContainerScreenState
    extends State<JobDetailsTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildColumncardanoon(context),
                SizedBox(height: 21.v),
                _buildJobdetail(context),
                SizedBox(height: 26.v),
                _buildTabview(context),
                _buildTabbarview(context)
              ],
            ),
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
        text: "Job Details",
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
              decoration: AppDecoration.fillGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder39,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgCardano1,
                height: 40.adaptSize,
                width: 40.adaptSize,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 16.v),
            Text(
              "Senior UI/UX Designer",
              style: CustomTextStyles.titleSmallBold,
            ),
            SizedBox(height: 7.v),
            Text(
              "Shopee Sg",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 12.v),
            Wrap(
              runSpacing: 9.v,
              spacing: 9.h,
              children: List<Widget>.generate(
                  2, (index) => ChipviewfulltimItemWidget()),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildJobdetail(BuildContext context) {
    return SizedBox(
      height: 100.v,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 24.h,
          right: 64.h,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 54.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return JobdetailItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return SizedBox(
      height: 44.v,
      width: 351.h,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: theme.colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: 12.fSize,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: appTheme.gray500,
        unselectedLabelStyle: TextStyle(
          fontSize: 12.fSize,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: appTheme.gray100,
          borderRadius: BorderRadius.circular(
            22.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "Description",
            ),
          ),
          Tab(
            child: Text(
              "Requirement",
            ),
          ),
          Tab(
            child: Text(
              "Responsibilities",
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabbarview(BuildContext context) {
    return SizedBox(
      height: 468.v,
      child: TabBarView(
        controller: tabviewController,
        children: [
          SavedDetailJobPage(),
          SavedDetailJobPage(),
          SavedDetailJobPage()
        ],
      ),
    );
  }
}
