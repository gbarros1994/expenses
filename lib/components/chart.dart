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

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tra) {
      return sum + (tra['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                tr['day'].toString(),
                (tr['value'] as double),
                (tr['value'] as double) / _weekTotalValue,  
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}