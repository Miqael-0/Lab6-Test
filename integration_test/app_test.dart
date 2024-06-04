import 'package:flutter/material.dart';
import 'package:flutter_basics/components/bottom_nav_bar.dart';
import 'package:flutter_basics/screens/activation_screen.dart';
import 'package:flutter_basics/screens/engineer_list_screen.dart';
import 'package:flutter_basics/screens/factory_dashboard.dart';
import 'package:flutter_basics/screens/notification_settings_screen.dart';
import 'package:flutter_basics/screens/otp_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_basics/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Test', () {
    testWidgets('Verify app navigation and functionality', (WidgetTester tester) async {
      // Pump the app
      await tester.pumpWidget(MyApp());

      // Verify the initial route is the ActivationScreen
      expect(find.byType(ActivationScreen), findsOneWidget);

      // Enter a mobile number and accept the terms
      await tester.tap(find.byType(Checkbox));
      await tester.tap(find.text('Get Activation Code'));
      await tester.pumpAndSettle();

      // Verify the OTPScreen is displayed
      expect(find.byType(OTPScreen), findsOneWidget);

      // Enter the OTP and verify the FactoryDashboard is displayed
      await tester.enterText(find.byType(TextField), '123456');
      await tester.tap(find.text('Verify'));
      await tester.pumpAndSettle();
      expect(find.byType(FactoryDashboard), findsOneWidget);

      // Verify the bottom navigation bar is displayed
      expect(find.byType(BottomNavBar), findsOneWidget);

      // Tap the "Engineer List" button and verify the EngineerListScreen is displayed
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();
      expect(find.byType(EngineerListScreen), findsOneWidget);

      // Tap the "Factory" button and verify the FactoryDashboard is displayed
      await tester.tap(find.byIcon(Icons.factory));
      await tester.pumpAndSettle();
      expect(find.byType(FactoryDashboard), findsOneWidget);

      // Tap the "Settings" button and verify the NotificationSettingsScreen is displayed
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      expect(find.byType(NotificationSettingsScreen), findsOneWidget);
    });
  });
}