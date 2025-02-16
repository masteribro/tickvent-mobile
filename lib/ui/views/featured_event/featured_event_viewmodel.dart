import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tickvent/app/app.router.dart';

import '../../../app/app.locator.dart';

class FeaturedEventViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  goToViewTicketView() {
    navigationService.navigateToViewTicketView();
  }
  void goBack() {
    navigationService.back();
  }
}
