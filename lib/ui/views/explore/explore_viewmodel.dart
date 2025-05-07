import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ExploreViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  List categories = [
    {
      "title": "Music",
      "icon": "assets/images/headphone.svg",
    },
    {
      "title": "Art",
      "icon": "assets/images/pen-tool.svg",
    },
    {
      "title": "Expo",
      "icon": "assets/images/lamp-charge.svg",
    },
    {
      "title": "Education",
      "icon": "assets/images/teacher.svg",
    },
    {
      "title": "Religion",
      "icon": "assets/images/building.svg",
    },
  ];
}
