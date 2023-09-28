import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final dateFormatter = DateFormat.yMd();
const String str = "#,##0.00";
final numberFormatter = NumberFormat(str, "en_US");
enum Category {
  work, study, drink, eat
}

const categoryIcons = {
  Category.eat: Icons.lunch_dining,
  Category.drink: Icons.water_drop_rounded,
  Category.study: Icons.menu_book_rounded,
  Category.work: Icons.work,
};

class ChiTieu {
  final String id;
  final String title;
  final double price;
  final DateTime date;
  final Category category;

  ChiTieu(this.id, this.title, this.price, this.date, this.category);

  String get formatDate{
    return dateFormatter.format(date);
  }

  String get formatPrice{
    return numberFormatter.format(price);
  }
}