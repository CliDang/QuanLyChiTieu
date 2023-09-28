import 'dart:ffi';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money/widget/chitieulist.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money/entity/chitieu.dart';

class ThemChiTieuView extends StatefulWidget {
  const ThemChiTieuView({super.key});

  @override
  State<ThemChiTieuView> createState() {
    return _ThemChiTieuState();
  }
}

class _ThemChiTieuState extends State<ThemChiTieuView> {
  final _titleInputController = TextEditingController();
  final _priceInputController = TextEditingController();
  var _selectedCate = Category.eat;

  final dateFormatter = DateFormat.yMd();
  DateTime? _selectedDate;

  void _showDayPicker() async {
    final nowDate = DateTime.now();
    final startDate = DateTime(nowDate.year, nowDate.month, nowDate.month);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: nowDate,
        firstDate: startDate,
        lastDate: nowDate);
    setState(() {
      _selectedDate = pickedDate;
    });
    print("function is running");
  }

  @override
  void dispose() {
    _titleInputController.dispose();
    _priceInputController.dispose();
    super.dispose();
  }

  void _saveDateClick() {
    final enterPrice = double.tryParse((_priceInputController.text).trim());
    if (_titleInputController.text == "") {
      Fluttertoast.showToast(
          msg: "Vui lòng nhập tên",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (_priceInputController.text == "") {
      Fluttertoast.showToast(
          msg: "Vui lòng nhập giá",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (_selectedDate == null) {
      Fluttertoast.showToast(
          msg: "Vui lòng chọn ngày",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else if (enterPrice! < 0 ) {
      Fluttertoast.showToast(
          msg: "Vui lòng nhập giá lớn hơn 0",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else {
      Fluttertoast.showToast(
          msg: "${_titleInputController.text} - ${_priceInputController
              .text} VND - ${dateFormatter.format(
              _selectedDate!)} - ${_selectedCate.name}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print("run");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              label: Text("Tên"),
            ),
            controller: _titleInputController,
            maxLength: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text("Giá"),
                    suffixText: "VND",
                  ),
                  keyboardType: TextInputType.number,
                  controller: _priceInputController,
                ),
              ),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            _showDayPicker();
                            print("Clicked btn");
                          },
                          icon: const Icon(Icons.calendar_month)),
                      Text(_selectedDate == null
                          ? dateFormatter.format(DateTime.now())
                          : dateFormatter.format(_selectedDate!))
                    ],
                  )),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Loại chi tiêu: "),
              const SizedBox(
                width: 30,
              ),
              DropdownButton(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerRight,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                value: _selectedCate,
                items: Category.values
                    .map((e) =>
                    DropdownMenuItem(
                      alignment: Alignment.center,
                      value: e,
                      child: Text(e.name.toUpperCase()),
                    ))
                    .toList(),
                onChanged: (value) {
                  print(value);
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCate = value;
                  });
                },
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(this.context);
                  },
                  child: const Text("Thoát")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _saveDateClick();
                },
                child: const Text("Lưu"),
              )
            ],
          )
        ],
      ),
    );
  }
}
