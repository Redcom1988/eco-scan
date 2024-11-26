import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/points_provider.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PointsProvider()),
      ],
      child: const EcoScanApp(),
    ),
  );
}

class EcoScanApp extends StatelessWidget {
  const EcoScanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoScan',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
