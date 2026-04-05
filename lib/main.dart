import 'package:covid19_tracker/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            fixedSize: Size(
              MediaQuery.maybeOf(context)!.size.width * .9,
              MediaQuery.maybeOf(context)!.size.height * .05,
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 88, 164),
            foregroundColor: Colors.white,
            fixedSize: Size(
              MediaQuery.maybeOf(context)!.size.width * .9,
              MediaQuery.maybeOf(context)!.size.height * .05,
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
