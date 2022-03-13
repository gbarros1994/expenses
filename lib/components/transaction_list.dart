import 'package:expenses_v1/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ? Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Não há nenhuma transação cadastrada!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover
            ),
          )
        ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(child: Text('R\$${tr.value}')),
              ),
            ),
            title: Text(
              tr.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              DateFormat('d MMM y').format(tr.date)
            ),
          );
        },
      ),
    );
  }
}