import 'package:flutter/material.dart';
import 'package:money/widget/chitieulist.dart';
import 'package:money/entity/chitieu.dart';
import 'package:money/widget/themchitieuview.dart';

class ChiTieuView extends StatefulWidget {
  const ChiTieuView({super.key});

  @override
  State<ChiTieuView> createState() => _ChiTieuViewState();
}

class _ChiTieuViewState extends State<ChiTieuView> {
  final List<ChiTieu> chiTieuList = [
    ChiTieu("eat01", "Bánh mì", 20000.0, DateTime.now(), Category.eat),
    ChiTieu("eat03", "Mì ý", 10000, DateTime.now(), Category.eat),
    ChiTieu("work01", "laptop", 20000000, DateTime.now(), Category.work),
    ChiTieu("work05", "Dien Thoai", 10000, DateTime.now(), Category.work),
    ChiTieu("work05", "Xe tăng", 300000000, DateTime.now(), Category.study),
    ChiTieu("work05", "Cà phê", 18000, DateTime.now(), Category.drink),
  ];

  void _themChiTieu(ChiTieu chiTieu) {
    setState(() {
      chiTieuList.add(chiTieu);
    });
    //print(chiTieuList.length);
  }

  void _moThemChiTieu() {
    showModalBottomSheet(
        context: context,
        builder: (themChiTieuContext) {
          return ThemChiTieuView(themChiTieu: _themChiTieu);
        });
  }

  void _xoaChiTieu(ChiTieu chiTieu) {
    //lấy index của nó để undo đúng vị trí
    final chiTieuIndex = chiTieuList.indexOf(chiTieu);
    setState(() {
      chiTieuList.remove(chiTieu);
    });
    //print(chiTieuList.length);

    //xoa Snackbar cu khi tao Snackbar moi
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: const Text("Xóa thành công"),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(label: "Tạo lại", onPressed: (){
              setState(() {
                //undo dung vi tri da xoa
                chiTieuList.insert(chiTieuIndex, chiTieu);
              });
            }),
        )
    );
  }



  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("Hiện không có chi tiêu nào"),
    );

    if (chiTieuList.isNotEmpty){
      mainContent = ChiTieuList(chiTieuList: chiTieuList, xoaChiTieu: _xoaChiTieu);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Quản lý chi tiêu"),
          actions: [
            IconButton(onPressed: _moThemChiTieu, icon: const Icon(Icons.add)),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              const Text("Chart",
                  style: TextStyle(decoration: TextDecoration.none)),
              Expanded(
                  child: mainContent,
              )
            ],
          ),
        ));
  }
}
