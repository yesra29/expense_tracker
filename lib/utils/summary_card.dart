import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String duration;
  const SummaryCard({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(16),
        color: Colors.green.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text("")
          ],
        ),
      ),
    );
  }
}
