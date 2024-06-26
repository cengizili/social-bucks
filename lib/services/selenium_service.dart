import 'dart:convert';
import 'dart:io';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:social_bucks/services/browser_service.dart';
import 'package:social_bucks/services/html_helpers.dart';




typedef EitherSingleOrMultiple = Either<Bs4Element?, List<Bs4Element?>>;
typedef EitherOfTwo = Either<EitherSingleOrMultiple?, EitherSingleOrMultiple?>;
typedef EitherOfFour = Either<EitherOfTwo?, EitherOfTwo?>;

extension EitherOfTwoX on EitherOfTwo {
  EitherSingleOrMultiple? get second => fold<EitherSingleOrMultiple?>((_) => null, (r) => r);
  EitherSingleOrMultiple? get first => fold<EitherSingleOrMultiple?>((l) => l, (_) => null);
  EitherOfTwo? foldTwo({
    void Function(EitherSingleOrMultiple? singleOrMultiple)? onFirst,
    void Function(EitherSingleOrMultiple? singleOrMultiple)? onSecond,
  }) {
   this.fold(
      (left) => onFirst?.call(left),
      (right) => onSecond?.call(right),
    );
  return this;
  }
}

extension EitherOfFourX on EitherOfFour {
  EitherSingleOrMultiple? get first => fold<EitherSingleOrMultiple?>((l) => l?.fold((l) => l, (r) => null), (r) => r?.fold((l) => null, (r) => null));
  EitherSingleOrMultiple? get second => fold<EitherSingleOrMultiple?>((l) => l?.fold((l) => null, (r) => r), (r) => r?.fold((l) => null, (r) => null));
  EitherSingleOrMultiple? get third => fold<EitherSingleOrMultiple?>((l) => l?.fold((l) => null, (r) => null), (r) => r?.fold((l) => l, (r) => null));
  EitherSingleOrMultiple? get fourth => fold<EitherSingleOrMultiple?>((l) => l?.fold((l) => null, (r) => null), (r) => r?.fold((l) => null, (r) => r));

  EitherOfFour? foldFour({
    void Function(EitherSingleOrMultiple? singleOrMultiple)? onFirst,
    void Function(EitherSingleOrMultiple? singleOrMultiple)? onSecond,
    void Function(EitherSingleOrMultiple? singleOrMultiple)? onThird,
    void Function(EitherSingleOrMultiple? singleOrMultiple)? onFourth,
  }) {
   this.fold(
      (left) => left?.fold((l) => onFirst?.call(l), (r) => onSecond?.call(r)),
      (right) => right?.fold((l) => onThird?.call(l), (r) => onFourth?.call(r)),
    );
  return this;
  }
}

extension EitherX<L, R> on EitherSingleOrMultiple {
  Bs4Element? get single => fold<Bs4Element?>((r) => r, (_) => null);
  List<Bs4Element?> get multiple => fold<List<Bs4Element?>>((_) => [], (l) => l);
  Future<EitherSingleOrMultiple?> click ({Duration? duration, bool once = false}) async => await single?.click(duration: duration, once: once);
  Future<EitherSingleOrMultiple?> clickAll ({Duration? duration, bool once = false}) async {
    for (var m in multiple) {
      await m?.click(duration: duration, once: once);
    }
  }
  Future<String?> download ({Duration? duration}) async => await single?.download(duration: duration);
  Future<bool?> hideOutside ({Duration? duration}) async => await single?.hideOutside(duration: duration);
  Future<EitherSingleOrMultiple?> typeText (String text, {Duration? duration}) async => await single?.typeText(text, duration: duration);
}

String endScript = '''
      clearInterval(interval);
      isRunning = false;
    ''';
     
  

class Selenium {

  Bs4Element bs4 = BeautifulSoup("<div></div>").body!.nextElement!;
  String document = "document";
  static Selenium? _instance;
  static Selenium instance = _instance ?? Selenium();
  Map clickedElements = {};

  static Future<List<EitherSingleOrMultiple?>> flow (List<Future<EitherSingleOrMultiple?>> selectors) async {
    var results = <EitherSingleOrMultiple?>[];
    for (var future in selectors) {
      final result = await future;  // Waits for the future to complete before proceeding
      results.add(result);
    }
    return results;
  }

  void switchToIframe(CSSElements iframe){
    Selenium.instance.document = iframe.selector;
  }

  void switchToDocument(){
    Selenium.instance.document = "document";
  }

}

extension InAppWebViewControllerX on InAppWebViewController {
  Future<CallAsyncJavaScriptResult?> callAsyncJavaScriptWithTimeOut(String script, {Duration? duration}) async {
    final String functionBody = """
    var isRunning = false;
    var p = new Promise(function (resolve, reject) {
      var interval = setInterval(() => {
        try {
          if (!isRunning){
            isRunning = true;
            $script
          }
        }
        catch (e) {
          console.log(e.toString());
        }
        if (new Date().getTime() - startTime > ${(duration ?? Duration(seconds: 20)).inMilliseconds}) {
          clearInterval(interval);
          console.log('Function ended without returning a value');
          reject(false); // Reject with an error message
        }
      }, 500);
      var startTime = new Date().getTime(); // Record the start time
    });
    await p;
    return p;
    """;
    return await this.callAsyncJavaScript(functionBody: functionBody);
  }
}

extension Bs4ElementX on Bs4Element {

  Future<EitherSingleOrMultiple?> click({Duration? duration, bool once = false}) async {
    if (Selenium.instance.clickedElements.containsKey(selector) && once)
    return null;
    Selenium.instance.clickedElements[selector] = true;
    final jsCode = '''
        var element = ${Selenium.instance.document}.querySelectorAll('${selector}')[$selectedIndex];
        if (!element) {
            console.log('Element is not found for click event');
        }
        else {
        console.log('Element is found for click event');
        // Dispatch mouseover event to mimic hovering (some apps need this to enable the button)
        element.dispatchEvent(new MouseEvent('mouseover', { bubbles: true }));
        
        // Focus the button before clicking (mimics user action)
        element.focus();
        
        // Dispatch a 'mousedown' event
        element.dispatchEvent(new MouseEvent('mousedown', { bubbles: true, cancelable: true }));

        // Dispatch the 'click' event
        element.click(); // This could be sufficient by itself in many cases

        // Optionally, you can add 'mouseup' event if needed
        element.dispatchEvent(new MouseEvent('mouseup', { bubbles: true, cancelable: true }));

        // Blur the button after clicking (mimics user moving focus away)
        element.blur();
        
        console.log('Element is clicked successfully');
        resolve(true);
        $endScript
        }
        ''';
    final res = await BrowserService.instance.webViewController?.callAsyncJavaScriptWithTimeOut(jsCode, duration: duration);
    if (res?.value == true)
    return Left(this);
  }

  Future<EitherSingleOrMultiple?> setText (String text, {Duration? duration}) async {
    final jsCode = '''
        var el = ${Selenium.instance.document}.querySelectorAll('${selector}')[$selectedIndex];
        if (!el) {
          console.log('Element is not found for typing event');
        } 
        else {
          el.value = '${text.replaceAll("'", "\\'")}';
           var changeEvent = new Event('change', {
              bubbles: true,
              cancelable: true
            });
            el.dispatchEvent(changeEvent);
          resolve(true);
          $endScript
        }
    ''';
    final res = await BrowserService.instance.webViewController?.callAsyncJavaScriptWithTimeOut(jsCode, duration: duration);
    if (res?.value == true)
    return Left(this);
  }

  Future<EitherSingleOrMultiple?> typeText (String text, {Duration? duration}) async {
    final jsCode = '''
      var el = ${Selenium.instance.document}.querySelectorAll('${selector}')[$selectedIndex];
      el.value = "";
      if (!el) {
          console.log('Element is not found for typing event');
      }
      else {
        console.log('Element found for typing event');
        var text = '$text'; // Example phone number to append after "+90 "

        // Set autocomplete off to prevent interference from the browser's autofill and autocorrect features
        el.setAttribute('autocomplete', 'off');

        // Focus on the element to simulate user clicking into the text field
        el.focus();

        // Function to simulate all relevant keyboard events for each character
        function simulateKeyInput(character) {
            const nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
            nativeInputValueSetter.call(el, el.value + character);
            
            el.dispatchEvent(new Event('input', { bubbles: true })); // most frameworks listen for this event

            // Optionally trigger change event if necessary (uncomment the following line if needed)
            // el.dispatchEvent(new Event('change', { bubbles: true }));
        }

        // Function to simulate typing each character with a delay to mimic human typing
        function simulateTyping(index) {
            if (index < text.length) {
                simulateKeyInput(text[index]);  // Input the next character
                setTimeout(function() {
                    simulateTyping(index + 1);  // Continue typing the next character
                }, 10);  // Delay between keystrokes in milliseconds
            } else {
                triggerEnterKey();  // Simulate pressing the Enter key after typing is complete
                console.log('Typing is successfull');
                resolve(true);
                $endScript
            }
        }

        // Function to simulate pressing the Enter key
        function triggerEnterKey() {
            el.dispatchEvent(new KeyboardEvent('keydown', { bubbles: true, cancelable: true, key: 'Enter', keyCode: 13, which: 13 }));
            el.dispatchEvent(new KeyboardEvent('keypress', { bubbles: true, cancelable: true, key: 'Enter', keyCode: 13, which: 13 }));
            el.dispatchEvent(new KeyboardEvent('keyup', { bubbles: true, cancelable: true, key: 'Enter', keyCode: 13, which: 13 }));
            
            // Blur the field to mimic user moving focus away after entry
            el.blur();
            el.dispatchEvent(new Event('change', { bubbles: true })); // Explicitly send change event if needed
        }

        simulateTyping(0);  // Start the typing simulation
          // Start the typing simulation
      }
      ''';
    final res = await BrowserService.instance.webViewController?.callAsyncJavaScriptWithTimeOut(jsCode, duration: duration);
    if (res?.value == true)
    return Left(this);
  }

  Future<String?> download({Duration? duration}) async {
    final script = """
        var element = ${Selenium.instance.document}.querySelectorAll('${selector}')[$selectedIndex];
        if (!element) {
          console.log('No image found');
        } else {
          var xhr = new XMLHttpRequest();
          xhr.onload = function() {
            var reader = new FileReader();
            reader.onloadend = function() {
              resolve(reader.result); // Resolves with the base64 string
              $endScript
            };
            reader.onerror = function() {
              console.log('Error reading the loaded image');
              reject('Failed to read image');
            };
            reader.readAsDataURL(xhr.response);
          };
          xhr.onerror = function() {
            console.log('Failed to load image');
            reject('Failed to load image');
          };
          xhr.open('GET', '${attributes["src"]}');  // Assuming `element.src` is the intended source
          xhr.responseType = 'blob';
          xhr.send();
        }
    """;
    final res = await BrowserService.instance.webViewController?.callAsyncJavaScriptWithTimeOut(script, duration: duration);
    if (res?.value != null)
    return res?.value;
  }

  Future<bool> hideOutside ({Duration? duration}) async {
    final jsCode = '''
        var element = ${Selenium.instance.document}.querySelectorAll('${selector}')[$selectedIndex];
         while (element.parentElement) {
            var children = Array.from(element.parentElement.children);
            children.forEach(child => {
                if (child !== element) {
                    child.style.display = 'none';
                }
            });
            element = element.parentElement;
            if (element.tagName === 'BODY') break;
            }
        resolve(true);
        $endScript
    ''';
    final result = await BrowserService.instance.webViewController?.callAsyncJavaScriptWithTimeOut(jsCode, duration: duration);
    return result?.value ?? false;
  }

  Future<bool> setColor (Color color) async {
    final jsCode = '''
        var element = ${Selenium.instance.document}.querySelectorAll('${selector}')[$selectedIndex];
        if (element) {
            element.style.backgroundColor = '${color.hex}';
        }
        resolve(true);
        $endScript
    ''';
    final result = await BrowserService.instance.webViewController?.callAsyncJavaScriptWithTimeOut(jsCode);
    return result?.value ?? false;
  }

  Future<EitherSingleOrMultiple?> scrollTo({double scrollHorizontallyPercent = 0.0, double scrollVerticallyPercent = 0.0, Duration? duration}) async {
    final jsCode = '''
      var element = ${Selenium.instance.document}.querySelectorAll('${selector}')[$selectedIndex];
      if (element) {
        var originalHorizontalScroll = element.scrollLeft;
        var originalVerticalScroll = element.scrollTop;
        var horizontalScrollAmount = element.offsetWidth * ${scrollHorizontallyPercent};
        var verticalScrollAmount = element.offsetHeight * ${scrollVerticallyPercent};
        
        element.scrollLeft += horizontalScrollAmount;
        element.scrollTop += verticalScrollAmount;
        
        var newHorizontalScroll = element.scrollLeft;
        var newVerticalScroll = element.scrollTop;
        
        if (originalHorizontalScroll !== newHorizontalScroll || originalVerticalScroll !== newVerticalScroll) {
          console.log('Element scrolled successfully');
          resolve(true);  // Scroll successful if either horizontal or vertical position changed
          $endScript
        } else {
          console.log('Failed to scroll element');
          reject(false);  // Scroll failed or element was already at both horizontal and vertical limits
        }
      } else {
        console.log('Element not found for scrolling yet');
      }
    ''';
    final result = await BrowserService.instance.webViewController?.callAsyncJavaScriptWithTimeOut(jsCode, duration: duration);
    if (result?.value == true)
    return Left(this);
  }

  Future<EitherSingleOrMultiple?> clickElement(CSSElements nextSelector, {Duration? duration, bool hasChildren = false, bool once=false}) async {
    final res = await findElement(nextSelector, hasChildren: hasChildren).then((value) async => await value?.click(once: once));
    Selenium.instance.clickedElements[nextSelector.selector] = true;
    return res;
  }

   Future<EitherSingleOrMultiple?> findElement(CSSElements nextSelector, {Duration? duration, bool hasChildren = false}) async {
      final document = selector == null ? "${Selenium.instance.document}" : "${Selenium.instance.document}.querySelectorAll('${selector}')[$selectedIndex]";
      final String script = """
        const hasChildren = ${hasChildren};  // This should be either true or false
        const elements = $document.querySelectorAll('${nextSelector.selector}');
        if (elements.length === 1) {
            console.log("Single element is found");
        }
        if (elements.length > 1) {
            console.log("Multiple elements are found");
        }
        if (elements.length > 0) {
            const filteredElements = Array.from(elements).filter(element => hasChildren ? element.children.length > 0 : true);
            if (filteredElements.length > 0) {
                const outerHTMLs = filteredElements.map(element => element.outerHTML); // Get only the outerHTML, excluding the element's own tag
                resolve(outerHTMLs);  // Resolve with the outerHTMLs of filtered elements
                $endScript
            } else {
                console.log("No elements meet the criteria");
            }
        } else {
            console.log("No elements found");
            isRunning = false;
        }
        """;
        final result = await BrowserService.instance.webViewController?.callAsyncJavaScriptWithTimeOut(script, duration: duration);
        if (result != null && result.error == null) {  
          final els = (result.value as List?) ?? [];
          if (els.length == 1)
          return Left(BeautifulSoup(els.first).body?.nextElement?..selectedIndex=(selectedIndex ?? 0)..selector=nextSelector.selector);
          if (els.length > 1)
          return Right(els.indexed.map((e) => BeautifulSoup(e.$2).body?.nextElement?..selector=nextSelector.selector..selectedIndex= e.$1).toList());
        } // Return null if no element is found or if an exception occurs
  }

  Future<EitherOfFour?> findAnyOf(List<CSSElements> selectors) async {
    final futures = selectors.indexed.map((e) => findElement(e.$2).then((value) => (value, e.$1)));
    final res = await Future.any(futures);
    if (res.$2 == 0)
    return Left(Left(res.$1));
    if (res.$2 == 1)
    return Left(Right(res.$1));
    if (res.$2 == 2)
    return Right(Left(res.$1));
    if (res.$2 == 3)
    return Right(Right(res.$1));
  }

  Future<EitherOfTwo?> findThisOrClickThis(CSSElements findSelector, CSSElements clickSelector) async {
    var firstFuture = clickElement(findSelector).then((value) => (value, 0));
    var secondFuture = findElement(clickSelector).then((value) => (value, 1));
    final res = await Future.any([firstFuture, secondFuture]);
    if (res.$2 == 0)
    return Left(res.$1);
    if (res.$2 == 1)
    return Right(res.$1);
  }

  Future<EitherOfTwo?> clickAnyOf(CSSElements firstSelector, CSSElements secondSelector) async {
    var firstFuture = clickElement(firstSelector).then((value) => (value, 0));
    var secondFuture = clickElement(secondSelector).then((value) => (value, 1));
    final res = await Future.any([firstFuture, secondFuture]);
    if (res.$2 == 0)
    return Left(res.$1);
    if (res.$2 == 1)
    return Right(res.$1);
  }

   Future<EitherSingleOrMultiple?> backspace({Duration? duration}) async {
    final jsCode = '''
      var el = ${Selenium.instance.document}.querySelectorAll('${selector}')[$selectedIndex];
      if (!el) {
          console.log('Element is not found for backspace event');
      }
      else {
        console.log('Element found for backspace event');

        // Focus on the element to simulate user clicking into the text field
        el.focus();

        // Function to simulate the backspace key event
        const nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
        var currentValue = el.value;
        nativeInputValueSetter.call(el, currentValue.substring(0, currentValue.length - 1));  // Remove last character

        el.dispatchEvent(new Event('input', { bubbles: true })); // Most frameworks listen for this event
        el.dispatchEvent(new Event('change', { bubbles: true })); // Optionally trigger change event if necessary
        
        console.log('Backspace event simulated successfully');
        resolve(true);
        $endScript
      }
      ''';
    final res = await BrowserService.instance.webViewController?.callAsyncJavaScriptWithTimeOut(jsCode, duration: duration);
    if (res?.value == true) {
      return Left(this);
    }
    return null;
  }

  Future<EitherSingleOrMultiple?> typeCharacter(String character, {Duration? duration}) async {
    final jsCode = '''
      var el = ${Selenium.instance.document}.querySelectorAll('${selector}')[$selectedIndex];
      if (!el) {
          console.log('Element is not found for typing event');
      }
      else {
        console.log('Element found for typing event');
        // Set autocomplete off to prevent interference from the browser's autofill and autocorrect features
        el.setAttribute('autocomplete', 'off');

        // Focus on the element to simulate user clicking into the text field
        el.focus();

        // Function to simulate all relevant keyboard events for the character
        const nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
        nativeInputValueSetter.call(el, el.value + '${character}');
        
        el.dispatchEvent(new Event('input', { bubbles: true })); // Most frameworks listen for this event
        el.dispatchEvent(new Event('change', { bubbles: true })); // Optionally trigger change event if necessary
        
        console.log('Character typed successfully');
        resolve(true);
        $endScript
      }
      ''';
    final res = await BrowserService.instance.webViewController?.callAsyncJavaScriptWithTimeOut(jsCode, duration: duration);
    if (res?.value == true) {
      return Left(this);
    }
    return null;
  }

}

extension ColorX on Color {
  String get hex{
  return '#${this.value.toRadixString(16).padLeft(8, '0').substring(2)}';
}
}