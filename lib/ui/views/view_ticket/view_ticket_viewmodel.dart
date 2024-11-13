import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tickvent/app/app.router.dart';

class ViewTicketViewModel extends BaseViewModel {
  final navigationService = NavigationService();

  void goBack() {
    navigationService.back();
  }
}
