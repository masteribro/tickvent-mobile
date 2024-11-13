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
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
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
)
class App {}
