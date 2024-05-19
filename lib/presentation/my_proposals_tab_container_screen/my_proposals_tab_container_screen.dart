import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../general_page/general_page.dart';

class MyProposalsTabContainerScreen extends StatefulWidget {
  const MyProposalsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MyProposalsTabContainerScreenState createState() =>
      MyProposalsTabContainerScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MyProposalsTabContainerScreenState
    extends State<MyProposalsTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.v),
              Container(
                height: 44.v,
                width: 202.h,
                margin: EdgeInsets.only(left: 24.h),
                child: TabBar(
                  controller: tabviewController,
                  labelPadding: EdgeInsets.zero,
                  labelColor: appTheme.blueGray400,
                  labelStyle: TextStyle(
                    fontSize: 12.fSize,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelColor:
                      theme.colorScheme.errorContainer.withOpacity(1),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.fSize,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: theme.colorScheme.errorContainer.withOpacity(1),
                    borderRadius: BorderRadius.circular(
                      12.h,
                    ),
                    border: Border.all(
                      color: appTheme.gray300,
                      width: 1.h,
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "General",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "My Proposals",
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 644.v,
                child: TabBarView(
                  controller: tabviewController,
                  children: [GeneralPage(), GeneralPage()],
                ),
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
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgComponent3Primary,
          margin: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 13.v,
          ),
          onTap: () {
            onTapImageone(context);
          },
        )
      ],
    );
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImageone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingsScreen);
  }
}
