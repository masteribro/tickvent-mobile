import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/common/app_colors.dart';

enum FlushBarType { success, failure }

class FlushBarService {
  Flushbar currentFlushBar = Flushbar();

  /// Call this function to show the FlushBar
  /// DO: locator<NavigationService>().back();
  ///
  /// WidgetsBinding.instance.addPostFrameCallback((_) {
  /// locator<FlushBarService>()
  ///                   .showFlushBar(
  ///                   variant: FlushBarType.success,
  ///                   message: res.left
  ///               );
  ///             });
  ///
  ///
  /// NOTE: Do not call this function across navigation or async gaps
  /// Ensure app is in stable state and with a defined context before
  /// displaying.
  ///
  ///
  /// DO NOT DO:
  /// flushbar.showFlushBar();
  /// Navigator.pop();
  ///
  ///
  /// The Code above would throw errors as the show() is an async function
  /// and even if the implementation permitted, the user would not see the
  /// Flushbar on the next/previous page as it is tied to a specific context.
  ///
  ///
  /// DO: Navigator.pop(result: {//Pass in RESULT//}) or equivalent navigation
  /// THEN: Call flushbar.showFlushBar(//Use RESULT Here//)
  /// FROM: dynamic result = await Navigator.push(...)
  ///
  ///
  Future<FutureOr<void>> showFlushBar(
      {FlushBarType? variant, String? message}) async {
    switch (variant) {
      case FlushBarType.success:
        currentFlushBar = Flushbar(
          messageText: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "$message",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () {
                    closeFlushBar();
                  },
                  height: 63,
                  minWidth: StackedService.navigatorKey?.currentContext != null
                      ? MediaQuery.of(
                              StackedService.navigatorKey!.currentContext!)
                          .size
                          .width
                      : 0,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    "DISMISS",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          duration: const Duration(seconds: 10),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.GROUNDED,
          backgroundColor: Colors.green,
          titleColor: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
        );
        StackedService.navigatorKey?.currentContext != null
            ? currentFlushBar.show(StackedService.navigatorKey!.currentContext!)
            : null;
        break;
      case FlushBarType.failure:
        currentFlushBar = Flushbar(
          messageText: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "$message",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () {
                    closeFlushBar();
                  },
                  height: 63,
                  minWidth: StackedService.navigatorKey?.currentContext != null
                      ? MediaQuery.of(
                              StackedService.navigatorKey!.currentContext!)
                          .size
                          .width
                      : 0,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    "DISMISS",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          duration: const Duration(seconds: 5),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.GROUNDED,
          backgroundColor: Colors.red,
          titleColor: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
        );
        StackedService.navigatorKey?.currentContext != null
            ? currentFlushBar.show(StackedService.navigatorKey!.currentContext!)
            : null;
        break;

      case null:
        break;
    }
  }

  void closeFlushBar() {
    currentFlushBar.dismiss();
  }
}
