import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:social_bucks/core/app_export.dart';
import 'package:social_bucks/core/utils/url_constants.dart';
import 'package:social_bucks/core/utils/validation_functions.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/services/html_helpers.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/services/selenium_service.dart';
import 'package:social_bucks/services/session.dart';
import 'package:uuid/uuid.dart';

extension RxBoolX on RxBool {
  Future<void> receiveUntil({Future<bool> Function()? validator}) async {
    Completer<void> completer = Completer<void>();
    bool allow = true;
    Worker worker = ever(
      this,
       (_) async {
            if (validator != null && allow){
              allow = false;
              final predicate = await validator.call();
              if (predicate){
                if (!completer.isCompleted)
                completer.complete();
              }
              allow = true;
            }
            else {
              if (!completer.isCompleted)
              completer.complete();
            }
      },
      onError: (error) => completer.completeError(error));

    try {
      await  completer.future;// Wait until the listener triggers completion.
    } catch (error) {
      completer.completeError(error);
    } finally {
      worker.dispose();
      this.value = false;
    }
  }
}


class BrowserService extends GetxController {
  static BrowserService? _instance;
  Uri? currentUrl;
  RxBool shouldIgnorePointer = false.obs;

  InAppWebViewController? webViewController;
  late PullToRefreshController pullToRefreshController;
  CookieManager cookieManager = CookieManager.instance();
  
  bool shouldTrigger = true;
  HeadlessInAppWebView? headlessInAppWebView;
  InAppWebViewKeepAlive keepAlive = InAppWebViewKeepAlive();
  RxBool onWebViewCreated = RxBool(false);
  RxBool onUpdateVisitedHistory= RxBool(false);
  RxBool onLoadStop= RxBool(false);
  String? reviewContent;
  
  static BrowserService get instance {
    if (_instance == null) {
      _instance = Get.put(BrowserService());
    }
    return _instance!;
  }

  Future<void> openUrl (String? url) async {
    if (url != null)
    await webViewController?.loadUrl(urlRequest: URLRequest(
      url: WebUri(url)
    ));
  }

  Future<void> ensureSignedIn () async {
    if (Session.instance.me.contribUrl == null)
     await Future.wait([
      openUrl(URLConstants.googleSignInUrl),
      onUpdateVisitedHistory.receiveUntil(
      validator: () async => (isValidGoogleMapsUrl(currentUrl.toString())) 
      )
     ]);
  }

  Future<void> ensureLocalGuide () async {
    if (Session.instance.me.contribUrl == null)
     await Future.wait([
      openUrl(URLConstants.localGuideSignUp),
      onUpdateVisitedHistory.receiveUntil(
      validator: () async => isValidLocalGuideUrl(currentUrl.toString())
      ).then((value) async {
        Session.instance.me.contribUrl = currentUrl.toString();
        await Session.instance.me.updateDB();
      })
     ]);
  }
  

  Future<void> mapsTaskHandler(String url) async {
    await Future.wait([
      openUrl(url),
      onUpdateVisitedHistory.receiveUntil(
        validator: () async => await Selenium.instance.bs4.clickElement(CSSElements.gmbNameHeader).then((value) => value != null),
      )
      .then((value) async {
        Get.dialog(Container(width: double.maxFinite, height: double.maxFinite,), barrierDismissible: false);
        await Selenium.instance.bs4.findElement(CSSElements.scroll)
        .then((value) async => 
        await value?.single?.scrollTo(scrollVerticallyPercent: 2)
        .then((value) async =>
        await Selenium.instance.bs4.findElement(CSSElements.makeReviewButton)
        .then((value) async => 
        await value?.multiple.lastOrNull?.click()
        .then((value) async => Selenium.instance.switchToIframe(CSSElements.iframe))
        .then((value) async => 
        await Selenium.instance.bs4.findElement(CSSElements.fiveStar)
        .then((value) async => await (value?.multiple.firstOrNull ?? value?.single)?.click()
        .then((value) async => 
        await Selenium.instance.bs4.clickElement(CSSElements.reviewArea)
        .then((value) async => await value?.single?.setText(reviewContent!)
        .then((value) async => 
         await Selenium.instance.bs4.clickElement(CSSElements.reviewArea)
        .then((value) async => await value?.single?.setText(reviewContent!)
        .then((value) async => 
        await Selenium.instance.bs4.clickElement(CSSElements.publishReviewButton)
        .then((value) async =>
        await onUpdateVisitedHistory.receiveUntil(
          validator: () async => true,
        )
        .then((value) {
          Get.back();
          Nav.back();
        })
        .then((value) => Selenium.instance.switchToDocument())
        )))))))))));
      })
    ]);
  }

  Future<void> init() async {
    keepAlive = InAppWebViewKeepAlive();
    headlessInAppWebView = HeadlessInAppWebView(
      keepAlive: keepAlive,
      initialSettings: settings,
      initialUrlRequest: URLRequest(
        url: WebUri("https://www.google.com.tr/")),
      onWebViewCreated: (controller) async {
        webViewController = controller;
      },
      onUpdateVisitedHistory: (controller, url, isReload) async {
        webViewController = controller;
        currentUrl = url;
      },
      onLoadStop: (controller, url) async {
        webViewController = controller;
        currentUrl = url;
      },
    );
    if (!headlessInAppWebView!.isRunning())
   await headlessInAppWebView!.run();
  }

  Widget get inAppWebView => InAppWebView(
    
    keepAlive: keepAlive,
      initialSettings: settings,
    headlessWebView: headlessInAppWebView,
    onWebViewCreated: (controller) async {
      webViewController = controller;
      // onWebViewCreated.customRefresh();
    },
    onPermissionRequest: (controller, request) async {
        return PermissionResponse(
            resources: request.resources,
            action: PermissionResponseAction.GRANT);
      },
    onConsoleMessage: (controller, consoleMessage) {
      print(consoleMessage);
    },
    onUpdateVisitedHistory: (controller, url, isReload) async {
      currentUrl = url;
      webViewController = controller;
      await Future.delayed(Duration(milliseconds: 500));
      onUpdateVisitedHistory.value = !onUpdateVisitedHistory.value;
    },
    onLoadStop: (controller, url) async {
      currentUrl = url;
      webViewController = controller;
      // onLoadStop.customRefresh();
    });

}

InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      forceDark: ForceDark.ON,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

