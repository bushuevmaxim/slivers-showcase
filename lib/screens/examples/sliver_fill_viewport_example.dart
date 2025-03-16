import 'package:flutter/material.dart';

class SliverFillViewportExample extends StatelessWidget {
  const SliverFillViewportExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('SliverFillViewport Example'),
            floating: true,
            pinned: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 150,
              color: Colors.grey,
              child: const Center(
                child: Text(
                  'A sliver that contains multiple box children that each fills the viewport.\nSliverFillViewport places its children in a linear array along the main axis. Each child is sized to fill the viewport, both in the main and cross axis.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverFillViewport(
            // Each child fills the viewport
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Create different colored pages with different content
                return Container(
                  color: _getPageColor(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getPageIcon(index),
                        size: 80,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Page ${index + 1}',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          _getPageDescription(index),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }

  Color _getPageColor(int index) {
    final colors = [
      Colors.blue[700],
      Colors.purple[700],
      Colors.green[700],
      Colors.orange[700],
      Colors.red[700],
    ];
    return colors[index % colors.length]!;
  }

  IconData _getPageIcon(int index) {
    final icons = [
      Icons.fullscreen,
      Icons.view_carousel,
      Icons.view_day,
      Icons.view_array,
      Icons.view_comfortable,
    ];
    return icons[index % icons.length];
  }

  String _getPageDescription(int index) {
    final descriptions = [
      'SliverFillViewport makes each child fill the entire viewport.',
      'Scroll up or down to navigate between pages.',
      'Each child takes exactly the height of the viewport.',
      'This is useful for creating page-based UIs.',
      'Perfect for onboarding screens or similar page-by-page experiences.',
    ];
    return descriptions[index % descriptions.length];
  }
}
