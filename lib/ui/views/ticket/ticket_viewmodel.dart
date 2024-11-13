import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tickvent/app/app.router.dart';

class TicketViewModel extends BaseViewModel {
  final navigationService = NavigationService();
  List ticketList = [
    "assets/coverImage.png",
    "assets/coverImage2.png",
    "assets/coverImage3.png"
  ];

  goToViewTicketView() {
    navigationService.navigateToViewTicketView();
  }
}
