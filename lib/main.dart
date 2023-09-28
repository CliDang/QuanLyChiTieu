import 'package:flutter/material.dart';
import 'package:money/widget/chitieuview.dart';

var appColorScheme = ColorScheme.fromSeed(seedColor:  const Color.fromARGB(
    255, 29, 108, 0));

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark(
      useMaterial3: true,
    ),
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: appColorScheme,
      cardTheme: const CardTheme().copyWith(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),

      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(

        )
      )
    ),
    home: const ChiTieuView(),
    debugShowCheckedModeBanner: true,
  ));
}
