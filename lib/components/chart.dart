import 'package:expenses_v1/components/chart_bar.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recenteTransaction;

  Chart(this.recenteTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {

      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recenteTransaction.length; i++) {
        bool sameDay = recenteTransaction[i].date.day == weekDay.day;
        bool sameMonth = recenteTransaction[i].date.month == weekDay.month;
        bool sameYear = recenteTransaction[i].date.year == weekDay.year;
      
        if (sameDay && sameMonth && sameYear) {
          totalSum += recenteTransaction[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0], 
        'value': totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr) {
          return ChartBar(tr['day'].toString(), 2, 0);
        }).toList(),
      ),
    );
  }
}