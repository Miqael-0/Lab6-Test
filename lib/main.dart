import 'package:flutter/material.dart';
import 'screens/activation_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/factory_dashboard.dart';
import 'screens/engineer_list_screen.dart';
import 'screens/invitation_screen.dart';
import 'screens/notification_settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ActivationScreen(),
        '/otp': (context) => OTPScreen(),
        '/dashboard': (context) => FactoryDashboard(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/engineerList') {
          final factoryId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => EngineerListScreen(factoryId: factoryId),
          );
        }
        if (settings.name == '/invitation') {
          final factoryId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => InvitationScreen(factoryId: factoryId),
          );
        }
        if (settings.name == '/settings') {
          final factoryId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => NotificationSettingsScreen(factoryId: factoryId),
          );
        }
        return null;
      },
    );
  }
}