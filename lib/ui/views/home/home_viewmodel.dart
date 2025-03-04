import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickvent/app/app.bottomsheets.dart';
import 'package:tickvent/app/app.dialogs.dart';
import 'package:tickvent/app/app.locator.dart';
import 'package:tickvent/app/app.router.dart';
import 'package:tickvent/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tickvent/ui/views/landing_page/landing_page.dart';

import '../landing_page/host_landing_page.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  goToViewTicketView() {
    navigationService.navigateToViewTicketView();
  }
}
