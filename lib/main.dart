import 'package:flutter/material.dart';
import 'package:expense/Widgets/home.dart';
// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.amber,
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 148, 111, 0),
);
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then(
  // (value) =>
  return runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        cardTheme: const CardTheme().copyWith(
          shadowColor: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: Colors.white,
            shadowColor: Colors.black,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        )),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 18,
                color: kDarkColorScheme.onPrimaryContainer,
              ),
              bodyMedium: TextStyle(
                color: Colors.amber[100],
              ),
            ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amber[200],
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.amber[50],
        ),
        cardTheme: const CardTheme().copyWith(
          shadowColor: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
            foregroundColor: Colors.white,
            shadowColor: Colors.black,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 18,
                color: kColorScheme.onPrimaryContainer,
              ),
            ),
      ),
      home: const Home(),
    ),
  );
  // );
}
