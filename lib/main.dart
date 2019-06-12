import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/routes/routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), // Spanish
      ],
      title: 'Components App',
      // pro navigation
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('route called: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage(),
        );
      },
    );
  }
}
