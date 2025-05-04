import 'package:stacked/stacked.dart';
import 'package:tickvent/app/app.locator.dart';
import 'package:tickvent/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tickvent/ui/views/landing_page/landing_page.dart';

import '../../common/local_storage.dart';
import '../../common/storage_dir.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    if( await locator<LocalStorage>().fetch(
        StorageDir.authToken)!= null ){
      _navigationService.navigateToView(const LandingPageManager());
    }else{
      _navigationService.replaceWithSignInView();
    }

  }
}
