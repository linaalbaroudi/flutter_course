import 'package:flutter/material.dart';
import 'package:meals_app/utils/palette.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.date,
      required this.amount});

  final String title;
  final double amount;
  final String date;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            icon,
          ],
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(date, style: Theme.of(context).textTheme.headlineSmall),
        trailing: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Palette.orange),
          child: Container(
            padding: EdgeInsets.only(top: 6, left: 8, right: 8),
            height: 36,
            child: Text("\$${amount.toStringAsFixed(2)}",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
