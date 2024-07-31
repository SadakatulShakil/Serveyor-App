import 'package:flutter/material.dart';

import 'TransactionItem.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TransactionItem(
          title: "Angga Big Park",
          amount: 49509,
          date: DateTime(2024, 1, 12),
          duration: Duration(hours: 10),
          icon: Icons.grid_view,
          color: Colors.blue,
        ),
        TransactionItem(
          title: "Top Up",
          amount: 43129509,
          date: DateTime(2024, 1, 12),
          icon: Icons.wallet,
          color: Colors.green,
        ),
        TransactionItem(
          title: "Angga Big Park",
          amount: 49509,
          date: DateTime(2024, 1, 12),
          duration: Duration(hours: 10),
          icon: Icons.grid_view,
          color: Colors.blue,
        ),
        TransactionItem(
          title: "Angga Big Park",
          amount: 49509,
          date: DateTime(2024, 1, 12),
          duration: Duration(hours: 10),
          icon: Icons.grid_view,
          color: Colors.blue,
        ),
      ],
    );
  }
}