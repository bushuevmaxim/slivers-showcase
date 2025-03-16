import 'package:flutter/material.dart';

class SliverOpacityExample extends StatefulWidget {
  const SliverOpacityExample({super.key});

  @override
  State<SliverOpacityExample> createState() => _SliverOpacityExampleState();
}

class _SliverOpacityExampleState extends State<SliverOpacityExample> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('SliverOpacity Example'),
            floating: true,
            snap: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.opacity),
                onPressed: () {
                  setState(() {
                    // Toggle between 0.3 and 1.0
                    _opacity = _opacity > 0.5 ? 0.3 : 1.0;
                  });
                },
                tooltip: 'Toggle opacity',
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tap the opacity icon in the app bar to toggle the opacity of the grid below.',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverOpacity(
            opacity: _opacity,
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}