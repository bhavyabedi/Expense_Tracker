import 'package:flutter/material.dart';
import 'package:expense/Widgets/home.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.amber,
);
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amber[200],
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.amber[50],
        ),
        cardTheme: CardTheme().copyWith(
          shadowColor: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primary,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
        )),
      ),
      home: const Home(),
    ),
  );
}
