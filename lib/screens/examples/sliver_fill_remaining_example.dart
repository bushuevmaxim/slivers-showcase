import 'package:flutter/material.dart';

class SliverFillRemainingExample extends StatefulWidget {
  const SliverFillRemainingExample({super.key});

  @override
  State<SliverFillRemainingExample> createState() => _SliverFillRemainingExampleState();
}

class _SliverFillRemainingExampleState extends State<SliverFillRemainingExample> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
        title: const Text('SliverFillRemaining Examples'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Basic Example'),
            Tab(text: 'With Form'),
            Tab(text: 'With ScrollBody'),
            Tab(text: 'With FillOverscroll'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BasicExample(),
          FormExample(),
          ScrollBodyExample(),
          FillOverscrollExample(),
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
                    'Basic SliverFillRemaining',
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
    );
  }
}

class FormExample extends StatelessWidget {
  const FormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.purple[100],
            child: const Center(
              child: Text(
                'SliverFillRemaining with a Form',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Login Form Example',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Login', style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'SliverFillRemaining is perfect for forms that need to fill the available space while maintaining a fixed footer.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ScrollBodyExample extends StatelessWidget {
  const ScrollBodyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            color: Colors.teal[200],
            child: const Center(
              child: Text(
                'SliverFillRemaining with hasScrollBody: true',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: true, // This allows the ListView to scroll within the remaining space
          child: Container(
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.teal[100],
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'The content below is scrollable within the remaining space',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: Text('${index + 1}'),
                          ),
                          title: Text('Scrollable Item ${index + 1}'),
                          subtitle: const Text('This ListView scrolls within SliverFillRemaining'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FillOverscrollExample extends StatelessWidget {
  const FillOverscrollExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 120,
            color: Colors.deepOrange[200],
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'SliverFillRemaining with fillOverscroll: true',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 80,
            color: Colors.deepOrange[100],
            child: const Center(
              child: Text(
                'Try overscrolling at the bottom!',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true, // This makes the container expand when overscrolling
          child: Container(
            color: Colors.orange[300],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.swipe_down_alt, size: 60, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    'Overscroll Behavior',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'With fillOverscroll: true, this container will expand when you overscroll at the bottom of the screen. This creates a stretching effect that can be used for pull-to-refresh or other interactive features.',
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
    );
  }
}