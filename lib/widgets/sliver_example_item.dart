import 'package:flutter/material.dart';
import '../models/sliver_example.dart';

class SliverExampleItem extends StatelessWidget {
  final SliverExample example;
  final VoidCallback onTap;

  const SliverExampleItem({
    super.key,
    required this.example,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(
          example.icon,
          size: 36,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          example.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(example.description),
        ),
        onTap: onTap,
      ),
    );
  }
}