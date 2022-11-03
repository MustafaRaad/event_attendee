import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const EventAtendeeApp());
}

class EventAtendeeApp extends StatelessWidget {
  final Color _primaryColor = Colors.teal;
  final Color _accentColor = Colors.purple;

  const EventAtendeeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Event Atendee',
        theme: ThemeData(
          primaryColor: _primaryColor,
          // primarySwatch: Colors.blue,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: _accentColor),
          scaffoldBackgroundColor: Colors.grey.shade100,
          fontFamily: 'Cairo',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 16.0),
          ),
        ),
        // initialRoute: '/',
        // routes: {LoginScreen.routeName: ((context) => const LoginScreen())},
        home: const SplashScreen(
          title: 'Event Atendee',
        ));
  }
}
