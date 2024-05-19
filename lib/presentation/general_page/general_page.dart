import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'widgets/general_item_widget.dart'; // ignore_for_file: must_be_immutable

class GeneralPage extends StatefulWidget {
  const GeneralPage({Key? key})
      : super(
          key: key,
        );

  @override
  GeneralPageState createState() => GeneralPageState();
}

class GeneralPageState extends State<GeneralPage>
    with AutomaticKeepAliveClientMixin<GeneralPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.background,
          child: Column(
            children: [SizedBox(height: 24.v), _buildGeneral(context)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGeneral(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.5.v),
            child: SizedBox(
              width: 323.h,
              child: Divider(
                height: 1.v,
                thickness: 1.v,
                color: appTheme.gray300,
              ),
            ),
          );
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return GeneralItemWidget();
        },
      ),
    );
  }
}
