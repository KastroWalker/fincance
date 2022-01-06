import 'package:finance/pages/expense_page.dart';
// import 'package:finance/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Finance',
    theme: ThemeData(
      primaryColor: Colors.lightGreen,
    ),
    // home: const HomePage(),
    home: const ExpensePage(),
    debugShowCheckedModeBanner: false,
  ));
}
