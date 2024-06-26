import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:social_bucks/core/app_export.dart';
import 'package:social_bucks/services/browser_service.dart';


class CustomWebView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: [
                      BrowserService.instance.inAppWebView
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
