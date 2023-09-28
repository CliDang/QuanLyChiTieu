import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/widget/chitieulist.dart';
import 'package:money/entity/chitieu.dart';
import 'package:money/widget/themchitieuview.dart';

class ChiTieuView extends StatefulWidget{
  const ChiTieuView({super.key});

  @override
  State<ChiTieuView> createState() => _ChiTieuViewState();
}

class _ChiTieuViewState extends State<ChiTieuView>{
  final List<ChiTieu> chiTieuList = [
    ChiTieu("eat01", "Banh mi", 20000.0, DateTime.now(), Category.eat),
    ChiTieu("eat02", "Mi tom", 20000, DateTime.now(), Category.eat),
    ChiTieu("eat03", "Mi y", 10000, DateTime.now(), Category.eat),
    ChiTieu("work01", "laptop", 20000000, DateTime.now(), Category.work),
    ChiTieu("work05", "Dien Thoai", 10000, DateTime.now(), Category.work),
    ChiTieu("eat06", "Mi y", 10000, DateTime.now(), Category.eat),
    ChiTieu("eat07", "Mi y", 10000, DateTime.now(), Category.eat),
    ChiTieu("eat08", "Mi y", 10000, DateTime.now(), Category.eat),
    ChiTieu("eat02", "Mi tom", 20000, DateTime.now(), Category.eat),
    ChiTieu("eat03", "Mi y", 10000, DateTime.now(), Category.eat),
    ChiTieu("work01", "laptop", 20000000, DateTime.now(), Category.work),
    ChiTieu("work05", "Dien Thoai", 10000, DateTime.now(), Category.work),
  ];

  void _moThemChiTieu() {
    showModalBottomSheet(
        context: context,
        builder: (themChiTieuContext) {
          return const ThemChiTieuView();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quản lý chi tiêu"),
          actions: [
            IconButton(onPressed: _moThemChiTieu, icon: const Icon(Icons.add)),
          ],
        ),
        body:  SafeArea(
          child: Column(
            children: [
              const Text("Chart", style: TextStyle(decoration: TextDecoration.none)),
              Expanded(child: ChiTieuList(chiTieuList)),
            ],
          ),
        )
    );
  }
}

