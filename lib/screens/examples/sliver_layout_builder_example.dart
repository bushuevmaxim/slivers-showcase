import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' as rendering;

class SliverLayoutBuilderExample extends StatelessWidget {
  const SliverLayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('SliverLayoutBuilder Example'),
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'SliverLayoutBuilder adapts to available space',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverLayoutBuilder(
            builder: (BuildContext context, rendering.SliverConstraints constraints) {
              // Get the available width to determine columns
              final double width = constraints.crossAxisExtent;
              final int columns = (width / 120).floor().clamp(1, 6);
              
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: Colors.amber[100],
                    child: Text(
                      'Available width: ${width.toStringAsFixed(1)}px\nColumns: $columns',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
          SliverLayoutBuilder(
            builder: (BuildContext context, rendering.SliverConstraints constraints) {
              // Get the available width to determine columns
              final double width = constraints.crossAxisExtent;
              final int columns = (width / 120).floor().clamp(1, 6);
              
              return SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      color: Colors.purple[100 + (index % 9) * 100],
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 12,
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Try rotating your device or resizing the window to see how the grid adapts',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}