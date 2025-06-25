import 'package:flutter/material.dart';

class TransactionItem {
  final IconData icon;
  final String label;
  final double amount;
  final Color color;

  TransactionItem({
    required this.icon,
    required this.label,
    required this.amount,
    required this.color,
  });
}

class RecentTransactionsCard extends StatelessWidget {
  final List<TransactionItem> transactions;

  const RecentTransactionsCard({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recent transactions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...transactions.map((tx) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: tx.color.withOpacity(0.2),
                    child: Icon(tx.icon, color: tx.color),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(tx.label)),
                  Text(
                    "₹${tx.amount.toStringAsFixed(0)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
