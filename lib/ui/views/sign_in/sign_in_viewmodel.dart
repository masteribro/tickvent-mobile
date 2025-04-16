import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tickvent/services/flush_bar_service.dart';
import 'package:tickvent/services/user_service.dart';

import '../../../app/app.locator.dart';
import '../../../services/auth_service.dart';
import '../../common/local_storage.dart';
import '../../common/storage_dir.dart';
import '../landing_page/landing_page.dart';
bool isLogin = false;
class SignInViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  PageController pageController = PageController();
  TextEditingController pinController = TextEditingController();
  TextEditingController passCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final navigationService = locator<NavigationService>();

  void createAccount(String email) async {
    setBusy(true);
    final result = await _authService.createAccount(email);
    result.when(
      ifLeft: (value) {
        locator<FlushBarService>()
            .showFlushBar(variant: FlushBarType.failure, message: value.value);
      },
      ifRight: (value) async {
        await locator<FlushBarService>()
            .showFlushBar(variant: FlushBarType.success, message: value.value.message);
        locator<LocalStorage>().save(StorageDir.userEmail, value.value.data?.email);
        pageController.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.easeIn);
      },
    );
    setBusy(false);
  }

  void sendOtp(String email, int otp) async {
    setBusy(true);
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
    setBusy(false);
  }

  void login(String email, int passCode) async {
    setBusy(true);
    final result = await _authService.login(email, passCode);
    result.when(
      ifLeft: (value) {
        locator<FlushBarService>()
            .showFlushBar(variant: FlushBarType.failure, message: value.value);
      },
      ifRight: (value) async {
        isLogin = true;
        notifyListeners();
        locator<UserService>().setUser(value.value);
        await locator<LocalStorage>().save(StorageDir.isPassCodeSet, true);
        final localStorage = locator<LocalStorage>();
        await localStorage.save(
            StorageDir.authToken, value.value.data?.apiToken);

        // await localStorage.save(StorageDir.authUser, value.value.data);
        navigationService.navigateToView(const LandingPageManager());
      },
    );
    setBusy(false);
  }
}
