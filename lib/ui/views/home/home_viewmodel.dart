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

import '../../../models/create_passcode_request.dart';
import '../../../services/auth_service.dart';
import '../../../services/flush_bar_service.dart';
import '../../common/local_storage.dart';
import '../../common/storage_dir.dart';
import '../landing_page/host_landing_page.dart';

class HomeViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  bool hasShownBottomSheet = false;
  final TextEditingController passCodeController = TextEditingController();
  bool canClose = false;
  late BuildContext context;
  String? email;
  bool isAlreadySet = false;
  Future runStartupLogic(context) async {}

  void setPassCode(CreatePasscodeRequest request, context) async {
    setBusy(true);
    final result = await _authService.setPassCode(request);
    result.when(
      ifLeft: (value) {
        locator<FlushBarService>()
            .showFlushBar(variant: FlushBarType.failure, message: value.value);
      },
      ifRight: (value) async {
        isAlreadySet = true;
        notifyListeners();
        await locator<LocalStorage>().save(StorageDir.isPassCodeSet, true);
        notifyListeners();
        // await locator<FlushBarService>().showFlushBar(variant: FlushBarType.success, message: value.value);
        // final localStorage = locator<LocalStorage>();
        // String? token = await localStorage.save(StorageDir.authToken, value);

        Navigator.of(context).pop();
      },
    );
    setBusy(false);
  }

  goToViewTicketView() {
    navigationService.navigateToViewTicketView();
  }
}
