// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';
import './widgets/newtransaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expensive Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Finance',
          appBarTheme: AppBarTheme(
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.purple,
                  fontFamily: 'QuickKiss',
                  fontSize: 30,
                  fontWeight: FontWeight.w500))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //const MyHomePage({super.key});
  void _plzaddtolist(String tit, double mo) {
    setState(() {
      userTransaction.add(Transaction(
          id: (userTransaction.isEmpty) ? 1 : 1 + userTransaction.last.id,
          title: tit,
          amount: mo,
          date: DateTime.now()));
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(_plzaddtolist);
        });
  }

  List<Transaction> get _recentTransactions {
    return userTransaction.where((txn) {
      return txn.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: Icon(Icons.account_balance_wallet)),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add_circle_outline_sharp))
        ],
        title: const Text('Expense Tracker App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Chart(_recentTransactions),
          Column(children: [
            TransactionList(),
          ]),
        ],
      ),
    );
  }
}
