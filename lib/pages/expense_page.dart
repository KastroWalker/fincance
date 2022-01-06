import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:finance/schemas/expenses_schema.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class Expense {
  double value;
  String name;
  String category;

  Expense(this.value, this.name, this.category);
}

class _ExpensePageState extends State<ExpensePage> {
  late String _typeValue;
  final _valueController = TextEditingController();

  void _saveExpense() {
    if (_typeValue.isNotEmpty && _valueController.text.isNotEmpty) {
      ExpenseOption? type = expenses[_typeValue];
      Expense newExpense = Expense(
          double.parse(_valueController.text), type!.name, type.category);
      print(newExpense.name);
      print(newExpense.category);
      print(newExpense.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Expense"),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownSearch<String>(
              mode: Mode.MENU,
              showSearchBox: true,
              items: expenses.keys.toList(),
              dropdownSearchDecoration: const InputDecoration(
                labelText: "Type",
              ),
              onChanged: (value) {
                setState(() {
                  _typeValue = value!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _valueController,
              decoration: const InputDecoration(
                labelText: "Value",
                prefixText: "R\$ ",
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 65, //height of button
              width: 400, //width of button
              child: ElevatedButton(
                onPressed: () {
                  _saveExpense();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
