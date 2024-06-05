import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_basics/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Test', () {
    testWidgets('Navigate to OTP Screen', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the initial screen
      expect(find.text('Welcome !'), findsOneWidget);

      // Tap the checkbox to accept terms and conditions
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      // Tap the "Get Activation Code" button
      await tester.tap(find.text('Get Activation Code'));
      await tester.pumpAndSettle();

      // Verify the OTP screen
      expect(find.text('Enter the activation code you received via SMS.'), findsOneWidget);
    });
  });
}