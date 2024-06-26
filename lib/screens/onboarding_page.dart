import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/widgets/custom_elevated_button.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int sliderIndex = 0;

  final items = [
    ("The best app for earning money with social media",
    "Withdraw money you've earned with any payment method you wish, it's going to be in your account within seconds.",
    ImageConstant.imgImage),
    ("The time you spend on social media is never going to be wasted anymore",
    "Tasks are really simple, they're nothing more than you usually do in social media.",
    ImageConstant.imgImage337x306),
    ("You're all set!",
    "You're all set, you can start to enjoy Social Bucks now.",
    ImageConstant.imgImage332x313)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppbar(context),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgOnboardingOne,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: items[sliderIndex].$3,
                  height: 343.v,
                  width: 283.h,
                ),
                SizedBox(height: 5.v),
                _buildStackthebestapp(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarousels(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 39.h,
          vertical: 32.v,
        ),
        decoration: AppDecoration.white.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 246.h,
              child: LocaleText(
                items[sliderIndex].$1,
                style: theme.textTheme.headlineSmall,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 18.v),
            SizedBox(
              width: 243.h,
              child: LocaleText(
                items[sliderIndex].$2,
                maxLines: 4,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallGray500SemiBold.copyWith(
                  height: 1.57,
                ),
              ),
            ),
            SizedBox(height: 20.v),
            CustomElevatedButton(
              width: 120.h,
              onPressed: () async {
                if (sliderIndex < items.length-1)
                setState(() {
                  sliderIndex++;
                });
                else
                Nav.toNamed(AppRoutes.login);
              },
              text: sliderIndex == items.length-1 ? "Get started" : "Next",
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      height: 49.v,
      actions: [
        AppbarSubtitleOne(
          text: "Skip",
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 13.v,
          ),
          onTap: () {
            Nav.toNamed(AppRoutes.login);
          },
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildStackthebestapp(BuildContext context) {
    return SizedBox(
      height: 335.v,
      width: 327.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 335.v,
              initialPage: 0,
              autoPlay: false,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: 3,
            itemBuilder: (context, index, realIndex) {
              return _buildCarousels(context);
            },
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     height: 10.v,
          //     margin: EdgeInsets.only(bottom: 112.v),
          //     child: AnimatedSmoothIndicator(
          //       activeIndex: sliderIndex,
          //       count: 3,
          //       axisDirection: Axis.horizontal,
          //       effect: ScrollingDotsEffect(
          //         spacing: 12,
          //         activeDotColor: theme.colorScheme.primary,
          //         dotColor: theme.colorScheme.primary.withOpacity(0.41),
          //         dotHeight: 10.v,
          //         dotWidth: 10.h,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  /// Navigates to the signUpCreateAcountScreen when the action is triggered.
  onTapMediumlabel(BuildContext context) {
  }
}
