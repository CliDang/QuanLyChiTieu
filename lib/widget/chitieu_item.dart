import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/entity/chitieu.dart';

class ChiTieuItem extends StatelessWidget{

  final ChiTieu chiTieu;

  const ChiTieuItem({super.key, required this.chiTieu});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:const  EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(categoryIcons[chiTieu.category]),
                const SizedBox(width: 9,),
                Text(chiTieu.title),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                Text("${chiTieu.formatPrice} VND"), //hien thi gia 2 chu so thap phan
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.alarm),
                    const SizedBox(width: 3,),
                    Text(chiTieu.formatDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }


}