import 'package:flutter/material.dart';

class SliverFillRemainingExample extends StatelessWidget {
  const SliverFillRemainingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('SliverFillRemaining Example'),
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 150,
              color: Colors.amber[200],
              child: const Center(
                child: Text(
                  'This is a SliverToBoxAdapter above',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.blue[200],
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.fullscreen, size: 60, color: Colors.white),
                    SizedBox(height: 16),
                    Text(
                      'SliverFillRemaining',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'This sliver fills the remaining space in the viewport. It\'s useful when you want to ensure that a widget takes up all available space.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}