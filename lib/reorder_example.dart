import 'package:flutter/material.dart';

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key});

  @override
  State<ReorderableExample> createState() => _ReorderableExampleState();
}

class _ReorderableExampleState extends State<ReorderableExample> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    const Color oddItemColor = Colors.cyan;
    const Color evenItemColor = Colors.amber;

    return ReorderableListView.builder(
      buildDefaultDragHandles: false, //Remove
      padding: const EdgeInsets.symmetric(horizontal: 40),
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: ReorderableDragStartListener(
              index: index,
              child: const Icon(Icons
                  .drag_indicator_outlined)), //Wrap it inside drag start event listener
          key: Key('$index'),
          tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
          title: Text('Item ${_items[index]}'),
        );
      },
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }
}
