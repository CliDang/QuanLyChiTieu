import 'package:flutter/material.dart';
import 'package:money/widget/chitieuview.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: const ChiTieuView(),
    debugShowCheckedModeBanner: true,
  ));
}
