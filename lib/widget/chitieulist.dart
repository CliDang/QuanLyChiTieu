import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/entity/chitieu.dart';
import 'package:money/widget/chitieu_item.dart';

class ChiTieuList extends StatelessWidget{
  ChiTieuList (this.chiTieuList, {super.key});

  final List<ChiTieu> chiTieuList;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chiTieuList.length,
        itemBuilder: 
            (context, index) => ChiTieuItem(chiTieu: chiTieuList[index]),
      );

  }

}