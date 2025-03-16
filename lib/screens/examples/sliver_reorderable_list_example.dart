import 'package:flutter/material.dart';

class SliverReorderableListExample extends StatefulWidget {
  const SliverReorderableListExample({super.key});

  @override
  State<SliverReorderableListExample> createState() => _SliverReorderableListExampleState();
}

class _SliverReorderableListExampleState extends State<SliverReorderableListExample> {
  final List<String> _items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('SliverReorderableList Example'),
            floating: true,
            snap: true,
          ),
          SliverReorderableList(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return ReorderableDelayedDragStartListener(
                key: ValueKey(_items[index]),
                index: index,
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.drag_handle,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    title: Text(
                      _items[index],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text('Drag to reorder'),
                    trailing: const Icon(Icons.reorder),
                  ),
                ),
              );
            },
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final String item = _items.removeAt(oldIndex);
                _items.insert(newIndex, item);
              });
              
              // Show a snackbar to confirm the reordering
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Moved item from position $oldIndex to $newIndex'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}