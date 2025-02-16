import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ExploreViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  List categories = [
    {
      "title": "Music",
      "icon": "assets/headphone.svg",
    },
    {
      "title": "Art",
      "icon": "assets/pen-tool.svg",
    },
    {
      "title": "Expo",
      "icon": "assets/lamp-charge.svg",
    },
    {
      "title": "Education",
      "icon": "assets/teacher.svg",
    },
    {
      "title": "Religion",
      "icon": "assets/building.svg",
    },
  ];
}
