import 'package:flutter_test/flutter_test.dart';
import 'package:tickvent/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ExploreViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}