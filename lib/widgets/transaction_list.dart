// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

List<Transaction> userTransaction = [];

class TransactionList extends StatelessWidget {
  //const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 380,
        child: (userTransaction.isEmpty)
            ? Column(
                children: [
                  Text(userTransaction.length.toString()),
                  Container(
                    height: 300,
                    child: Image.asset(
                      'assets/images/basket.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text((index + 1).toString()),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.black12,
                              width: 3,
                            )),
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Text(
                              '₹ ${userTransaction[userTransaction.length - 1 - index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  userTransaction[
                                          userTransaction.length - index - 1]
                                      .title,
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                )),
                            Container(
                              child: Text(
                                  DateFormat('dd-MMM-yyyy hh:MM a').format(
                                      userTransaction[userTransaction.length -
                                              index -
                                              1]
                                          .date),
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 181, 181, 181),
                                    fontSize: 10,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: userTransaction.length,
              ));
  }
}
