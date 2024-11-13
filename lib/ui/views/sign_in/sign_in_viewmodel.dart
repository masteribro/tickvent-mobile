import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SignInViewModel extends BaseViewModel {
  PageController pageController = PageController();
  TextEditingController pinController = TextEditingController();
  final navigationService = locator<NavigationService>();
}
