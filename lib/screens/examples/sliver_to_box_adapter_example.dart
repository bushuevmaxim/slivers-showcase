import 'package:flutter/material.dart';

class SliverToBoxAdapterExample extends StatefulWidget {
  const SliverToBoxAdapterExample({super.key});

  @override
  State<SliverToBoxAdapterExample> createState() => _SliverToBoxAdapterExampleState();
}

class _SliverToBoxAdapterExampleState extends State<SliverToBoxAdapterExample> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverToBoxAdapter Examples'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Basic Example'),
            Tab(text: 'Interactive Example'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BasicExample(),
          InteractiveExample(),
        ],
      ),
    );
  }
}

class BasicExample extends StatelessWidget {
  const BasicExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SliverToBoxAdapter',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'This widget allows you to include non-sliver widgets inside a CustomScrollView. It\'s useful when you need to mix slivers with regular widgets.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text('List Item ${index + 1}'),
                subtitle: const Text('Regular list items below the box adapter'),
                leading: const Icon(Icons.arrow_right),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}

class InteractiveExample extends StatefulWidget {
  const InteractiveExample({super.key});

  @override
  State<InteractiveExample> createState() => _InteractiveExampleState();
}

class _InteractiveExampleState extends State<InteractiveExample> {
  double _value = 50;
  List<Color> _colors = [Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.red];
  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Interactive chart section using SliverToBoxAdapter
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Interactive Chart Example',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'SliverToBoxAdapter can be used to include interactive elements like charts, maps, or custom controls within a scrollable view.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    // Simple bar chart visualization
                    Container(
                      height: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (index) {
                          double height = (index == _selectedColorIndex) ? _value * 1.5 : _value;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColorIndex = index;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: height,
                              decoration: BoxDecoration(
                                color: _colors[index],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  '${height.toInt()}',
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Interactive slider to adjust chart values
                    Slider(
                      value: _value,
                      min: 20,
                      max: 120,
                      divisions: 10,
                      label: _value.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                    const Center(
                      child: Text('Drag to adjust chart values'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // List items below the interactive section
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Data Point ${index + 1}'),
                  subtitle: Text('Value: ${(_value * (index % 3 + 0.8)).toInt()}'),
                  leading: Icon(Icons.analytics, color: _colors[index % _colors.length]),
                ),
              );
            },
            childCount: 15,
          ),
        ),
      ],
    );
  }
}