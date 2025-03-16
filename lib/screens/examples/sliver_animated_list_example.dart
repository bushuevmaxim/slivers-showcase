import 'package:flutter/material.dart';

class SliverAnimatedListExample extends StatefulWidget {
  const SliverAnimatedListExample({super.key});

  @override
  State<SliverAnimatedListExample> createState() => _SliverAnimatedListExampleState();
}

class _SliverAnimatedListExampleState extends State<SliverAnimatedListExample> {
  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey<SliverAnimatedListState>();
  final List<String> _items = List.generate(10, (index) => 'Item ${index + 1}');
  
  void _addItem() {
    final int index = _items.length;
    _items.add('Item ${index + 1}');
    _listKey.currentState!.insertItem(index);
  }

  void _removeItem(int index) {
    final String removedItem = _items.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, animation, index),
    );
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        color: Colors.blue[100 + (index % 9) * 100],
        child: ListTile(
          title: Text(
            item,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('Tap to remove this item'),
          trailing: const Icon(Icons.delete_outline),
          onTap: () => _removeItem(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('SliverAnimatedList'),
            floating: true,
            snap: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _addItem,
                tooltip: 'Add an item',
              ),
            ],
          ),
          SliverAnimatedList(
            key: _listKey,
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation) {
              return _buildItem(_items[index], animation, index);
            },
          ),
        ],
      ),
    );
  }
}