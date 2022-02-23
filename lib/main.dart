import 'package:expenses_v1/components/transaction_form.dart';
import 'package:expenses_v1/components/transaction_list.dart';
import 'package:expenses_v1/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  
  final _transactions = [
    Transaction(
      id: 't1', 
      title: 'Novo tênis', 
      value: 310.76, 
      date: DateTime.now()
    ),
    Transaction(
      id: 't2', 
      title: 'Conta de Luz', 
      value: 211.76, 
      date: DateTime.now()
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          TransactionList(_transactions),
          TransactionForm(),
        ],
      ),
    );
  }
}