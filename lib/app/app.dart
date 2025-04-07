import 'package:tickvent/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tickvent/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tickvent/ui/views/home/home_view.dart';
import 'package:tickvent/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tickvent/ui/views/sign_in/sign_in_view.dart';
import 'package:tickvent/ui/views/explore/explore_view.dart';
import 'package:tickvent/ui/views/ticket/ticket_view.dart';
import 'package:tickvent/ui/views/settings/settings_view.dart';
import 'package:tickvent/ui/views/view_ticket/view_ticket_view.dart';
import 'package:tickvent/ui/views/host_event/host_event_view.dart';
import 'package:tickvent/ui/views/featured_event/featured_event_view.dart';
import 'package:tickvent/ui/views/manage_event/manage_event_view.dart';
import 'package:tickvent/ui/views/create_event/create_event_view.dart';

import '../network/api_service.dart';
import '../services/auth_service.dart';
import '../services/flush_bar_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: ExploreView),
    MaterialRoute(page: TicketView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: ViewTicketView),
    MaterialRoute(page: HostEventView),
    MaterialRoute(page: FeaturedEventView),
    MaterialRoute(page: ManageEventView),
    MaterialRoute(page: CreateEventView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: FlushBarService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
