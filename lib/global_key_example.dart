import 'package:flutter/material.dart';

final globalKey = GlobalKey<_CounterState>();

class GlobalKeyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: 100,
            child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      globalKey.currentState?._increament();
                    },
                    child: Text('Increase')))),
        Counter(
          key: globalKey,
        ),
      ],
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var _value = 0;
  void _increament() {
    setState(() {
      _value += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_value');
  }
}
