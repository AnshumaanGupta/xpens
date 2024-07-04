// ignore_for_file: prefer_const_constructors
import 'package:xpens/widgets/transaction_list.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  //const Chart({super.key});
  final List<Transaction> _recentTransactions;
  Chart(this._recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final iday = DateTime.now().subtract(Duration(days: index));
      double famount = 0;
      for (int i = 0; i < _recentTransactions.length; i++) {
        final today = _recentTransactions[i].date;

        if (today.day == iday.day &&
            today.month == iday.month &&
            today.year == iday.year) famount += _recentTransactions[i].amount;
      }
      print(DateFormat.E().format(iday));
      print(famount);
      return {'day': DateFormat.E().format(iday).substring(0,1), 'amount': famount};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [groupedTransactionValues.map((){}).toList();],
      ),
    );
  }
}
