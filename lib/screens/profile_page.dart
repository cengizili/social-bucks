import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iban/iban.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:social_bucks/core/utils/validation_functions.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/extensions.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/custom_text_form_field.dart';
import 'package:social_bucks/widgets/locale_text.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';


class ProfilePage extends StatefulWidget {
   ProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PaymentOption primaryPaymentMethod = Session.instance.me.primaryPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30.v),
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                children: [
                  _buildStackbgone(context),
                  SizedBox(height: 16.v),
                  Container(
                    width: 273.h,
                    margin: EdgeInsets.only(
                      left: 51.h,
                      right: 50.h,
                    ),
                    child: Obx(() => Text(
                      Session.instance.me.email,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.titleSmallBluegray400.copyWith(
                        height: 1.57,
                      ),
                    ),)
                  ),
                  SizedBox(height: 16.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _buildApplied(
                            context,
                            typesixteenOne: Session.instance.submissions.value.length.toString(),
                            reviewed: "Submitted",
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 17.h),
                            child: _buildApplied(
                              context,
                              typesixteenOne: Session.instance.submissions.value.approvals.length.toString(),
                              reviewed: "Approved",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24.v),
                  Divider(
                    color: appTheme.gray300,
                  ),
                  SizedBox(height: 22.v),
                  _buildFieldSection(context, PaymentOption.paypal),
                  SizedBox(height: 24.v),
                  _buildFieldSection(context, PaymentOption.iban),
                  SizedBox(height: 24.v),
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
      leadingWidth: 48.h,
      centerTitle: true,
      title: AppbarTitle(
        text: "Profile",
      ),
    );
  }

  /// Section Widget
  Widget _buildStackbgone(BuildContext context) {
    return SizedBox(
      height: 300.v,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgBg,
            height: 120.v,
            width: 327.h,
            radius: BorderRadius.circular(
              8.h,
            ),
            alignment: Alignment.topCenter,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 89.adaptSize,
                    height: 89.adaptSize,
                    child: RandomAvatar(Session.instance.me.uid),
                    decoration: BoxDecoration(
                      border: Border.all(width: 5.adaptSize, color: Colors.white),
                      borderRadius: BorderRadius.circular(
                      100.h,
                    ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Obx(() => Text(
                    Session.instance.me.username,
                    style: CustomTextStyles.titleMediumBlack900,
                  ),),
                  SizedBox(height: 7.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Obx(() => Text(
                          "\$"+Session.instance.me.balance.toString(),
                          style: CustomTextStyles.titleSmallGray500SemiBold,
                        ),)
                      ),
                      Container(
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        margin: EdgeInsets.only(
                          left: 10.h,
                          bottom: 3.v,
                        ),
                        padding: EdgeInsets.all(3.h),
                        decoration: AppDecoration.success.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgCheck,
                          height: 9.adaptSize,
                          width: 9.adaptSize,
                          alignment: Alignment.center,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 7.v),
                  LocaleText(
                    "Make sure to add a payment method below. This amount will be sent to the primary payment method provided below as soon as your balance are above \$ 50.0.",
                    style: CustomTextStyles.titleSmallGray500SemiBold,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFieldSection(BuildContext context, PaymentOption paymentOption) {
    final textEditingController = TextEditingController();
    final focusNode = FocusNode();
    final _formKey = GlobalKey<FormState>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          _buildRowskills(
            context,
            skills: paymentOption.displayName,
            editsquare: ImageConstant.imgEditSquare,
            onTapEditsquare: () => focusNode.requestFocus(),
          ),
          SizedBox(height: 14.v),
          CustomTextFormField(
            borderDecoration: OutlineInputBorder(
              borderSide: BorderSide(color: appTheme.gray300),
              borderRadius: BorderRadius.all(Radius.circular(10.adaptSize)),
            ),
            hintText: paymentOption.hintText,
            controller: textEditingController,
              validator:(value) => paymentOption.isValidValue(value) ? null : "Invalid Information",
              onChanged: (value) {
                if (_formKey.currentState != null) {
                  _formKey.currentState!.validate();
                }
              },
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildApplied(
    BuildContext context, {
    required String typesixteenOne,
    required String reviewed,
  }) {
    return Container(
      width: 134.h,
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              typesixteenOne,
              style: CustomTextStyles.titleMediumPrimaryBold_1.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 2.v,
              bottom: 3.v,
            ),
            child: LocaleText(
              reviewed,
              style: theme.textTheme.labelLarge!.copyWith(
                color: appTheme.blueGray400,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRowskills(
    BuildContext context, {
    required String skills,
    required String editsquare,
    Function()? onTapEditsquare,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: Text(
            skills,
            style: CustomTextStyles.titleMediumPrimarySemiBold.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        ChoiceChip(
          labelPadding: EdgeInsets.zero,
          label: LocaleText("Set as primary"),
          selectedColor: Colors.green[100],
          selected: (skills == "PayPal" && primaryPaymentMethod.index == 0) || (skills == "IBAN" && primaryPaymentMethod.index == 1),
          onSelected: (value) {
              setState(() {
                primaryPaymentMethod = skills == "PayPal" ? PaymentOption.paypal : PaymentOption.other;
                if (primaryPaymentMethod == PaymentOption.other)
                primaryPaymentMethod = skills == "IBAN" ? PaymentOption.iban : PaymentOption.other;

                Session.instance.me.writeRef.child("primaryPaymentMethod").set(primaryPaymentMethod.index);
              });
          },
          )
      ],
    );
  }
}
