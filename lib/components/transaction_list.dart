import 'package:expenses_v1/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;
  final Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty 
      ? LayoutBuilder(
        builder: ((context, constraints) {
            return Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Não há nenhuma transação cadastrada!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.60,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover
                  ),
                )
              ],
            );
          }
        )
      )
      : ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tr = transactions[index];
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Container(
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
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => onRemove(tr.id),
            ),
          ),
        );
      },
    );
  }
}