import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/entity/chitieu.dart';
import 'package:money/widget/chitieu_item.dart';

class ChiTieuList extends StatelessWidget {
  const ChiTieuList({super.key, required this.chiTieuList, required this.xoaChiTieu});

  final void Function(ChiTieu chiTieu) xoaChiTieu;
  final List<ChiTieu> chiTieuList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chiTieuList.length,
      itemBuilder: (context, index) =>
          Dismissible(
              onDismissed: (direction) => xoaChiTieu(chiTieuList[index]),
              key: ValueKey(chiTieuList[index]),
              child: ChiTieuItem(chiTieu: chiTieuList[index]))
    );
  }
}
