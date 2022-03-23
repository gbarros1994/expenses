
import 'package:expenses_v1/components/chart.dart';
import 'package:expenses_v1/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import '../models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final ThemeData tema = ThemeData();
 
    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final List<Transaction> _transactions = [];

  List<Transaction> get _recentTranscations {
    return _transactions.where((tra) {
      return tra.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
      final newTransaction = Transaction(
        id: Random().nextDouble().toString(), 
        title: title, 
        value: value, 
        date: date,
      );

      setState(() {
        _transactions.add(newTransaction);
      });

      // CLOSE MODAL
      Navigator.of(context).pop();
    }

    _removeTransaction(String id) {
      setState(() {
        _transactions.removeWhere((tr) => tr.id == id);
      });
    }


  _opentransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (ctx) {
        return TransactionForm(_addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: Text(
          'Despesas Pessoais'
        ),
        actions: [
          IconButton(
            onPressed: () => _opentransactionFormModal(context), 
            icon: Icon(Icons.add)
          )
        ],
      );
    final availabelHeight = MediaQuery.of(context).size.height
    - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: availabelHeight * 0.30,
              child: Chart(_recentTranscations),
            ),
            Container(
              height: availabelHeight * 0.70,
              child: TransactionList(_transactions, _removeTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _opentransactionFormModal(context), 
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}