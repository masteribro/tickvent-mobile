import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tickvent/services/flush_bar_service.dart';

import '../../../app/app.locator.dart';
import '../../../services/auth_service.dart';
import '../landing_page/landing_page.dart';

class SignInViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  PageController pageController = PageController();
  TextEditingController pinController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final navigationService = locator<NavigationService>();

  void createAccount(String email) async {
    final result = await _authService.createAccount(email);
    result.when(
      ifLeft: (value) {
        locator<FlushBarService>()
            .showFlushBar(variant: FlushBarType.failure, message: value.value);
      },
      ifRight: (value) async {
        await locator<FlushBarService>()
            .showFlushBar(variant: FlushBarType.success, message: value.value);
        pageController.nextPage(
            duration: Duration(seconds: 1), curve: Curves.easeIn);
      },
    );
  }
  void sendOtp(String email, int otp) async {
    final result = await _authService.sendOtp(email, otp);
    result.when(
      ifLeft: (value) {
        locator<FlushBarService>()
            .showFlushBar(variant: FlushBarType.failure, message: value.value);
      },
      ifRight: (value) async {
       navigationService.navigateToView(const LandingPageManager());
      },
    );
  }
  void Login(String email, int otp) async {
    final result = await _authService.sendOtp(email, otp);
    result.when(
      ifLeft: (value) {
        locator<FlushBarService>()
            .showFlushBar(variant: FlushBarType.failure, message: value.value);
      },
      ifRight: (value) async {
        navigationService.navigateToView(const LandingPageManager());
      },
    );
  }
}
