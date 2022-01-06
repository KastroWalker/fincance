import 'package:finance/pages/expense_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showExpensePage() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ExpensePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showExpensePage();
        },
        child: const Icon(Icons.attach_money),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
