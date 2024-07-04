// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

import './transaction_list.dart';
import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function work;

  NewTransaction(this.work);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final moneyController = TextEditingController();

  void _submitdata() {
    if (titleController.text.isEmpty ||
        moneyController.text.isEmpty ||
        double.parse(moneyController.text) <= 0) return;
    widget.work(titleController.text, double.parse(moneyController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: moneyController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitdata(),
                ),
                ElevatedButton(
                  onPressed: _submitdata,
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
