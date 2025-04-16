// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../network/api_service.dart';
import '../services/auth_service.dart';
import '../services/event_service.dart';
import '../services/flush_bar_service.dart';
import '../services/user_service.dart';
import '../ui/common/local_storage.dart';
import '../ui/views/sign_in/sign_in_viewmodel.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LocalStorage());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => FlushBarService());
  locator.registerLazySingleton(() => EventService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => SignInViewModel());
}
