import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tickvent/app/app.router.dart';

class TicketViewModel extends BaseViewModel {
  final navigationService = NavigationService();
  List ticketList = [
    "assets/images/coverImage.png",
    "assets/images/coverImage2.png",
    "assets/images/coverImage3.png"
  ];

  goToViewTicketView() {
    navigationService.navigateToViewTicketView();
  }
}
