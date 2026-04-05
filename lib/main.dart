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
        searchBarTheme: SearchBarThemeData(
          elevation: WidgetStatePropertyAll(1),
          side: WidgetStatePropertyAll(BorderSide(color: Colors.black)),
          padding: WidgetStatePropertyAll(
            EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 20),
          ),
        ),
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
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
        searchBarTheme: SearchBarThemeData(
          elevation: WidgetStatePropertyAll(1),
          side: WidgetStatePropertyAll(BorderSide(color: Colors.white)),
          padding: WidgetStatePropertyAll(
            EdgeInsetsGeometry.symmetric(vertical: 5, horizontal: 20),
          ),
        ),
        appBarTheme: AppBarThemeData(
          backgroundColor: const Color.fromARGB(255, 89, 35, 181),
          foregroundColor: Colors.white,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
