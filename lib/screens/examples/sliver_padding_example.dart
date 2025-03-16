import 'package:flutter/material.dart';

class SliverPaddingExample extends StatelessWidget {
  const SliverPaddingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('SliverPadding Example'),
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'SliverPadding adds space around its child sliver',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Without padding
          SliverToBoxAdapter(
            child: Container(
              color: Colors.amber[100],
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Grid without padding (edge-to-edge):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.blue[100 + (index % 9) * 100],
                  child: Center(
                    child: Text('${index + 1}'),
                  ),
                );
              },
              childCount: 9,
            ),
          ),
          // With padding
          SliverToBoxAdapter(
            child: Container(
              color: Colors.amber[100],
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 24.0),
              child: const Text(
                'Grid with SliverPadding:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.green[100 + (index % 9) * 100],
                    child: Center(
                      child: Text('${index + 1}'),
                    ),
                  );
                },
                childCount: 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}