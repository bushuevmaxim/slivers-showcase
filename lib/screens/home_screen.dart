import 'package:flutter/material.dart';
import '../widgets/sliver_example_item.dart';
import '../models/sliver_example.dart';
import '../utils/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slivers Showcase'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: sliverExamples.length,
        itemBuilder: (context, index) {
          final example = sliverExamples[index];
          return SliverExampleItem(
            example: example,
            onTap: () {
              Navigator.pushNamed(context, example.route);
            },
          );
        },
      ),
    );
  }
}