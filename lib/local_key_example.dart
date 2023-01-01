import 'dart:math';
import 'package:flutter/material.dart';

class LocalKeyExample extends StatefulWidget {
  @override
  State<LocalKeyExample> createState() => _LocalKeyExampleState();
}

class _LocalKeyExampleState extends State<LocalKeyExample> {
  List<Widget> tiles = [
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: Tile(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: Tile(),
    ),
  ];

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 100,
          child: Center(
            child: ElevatedButton(
                onPressed: swapTiles,
                child: const Text(
                  'Toggle',
                  textDirection: TextDirection.ltr,
                )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        )
      ],
    );
  }
}

class Tile extends StatefulWidget {
  const Tile({super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  final myColor = UniqueColorGenerator.getColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      width: 100,
      height: 100,
    );
  }
}

class UniqueColorGenerator {
  static final _random = Random();
  static Color getColor() {
    return Color.fromRGBO(
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1.0);
  }
}
