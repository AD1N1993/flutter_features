import 'package:flutter/material.dart';

final _key = GlobalKey();
final globalKey = GlobalKey();

class GlobalKeyShareExample extends StatelessWidget {
  const GlobalKeyShareExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Container(
              color: Colors.green[100],
              child: Foo(_key),
            );
          case 1:
            return Container(
              color: Colors.blue[100],
              child: Text("Blank Page"),
            );
          case 2:
            return Container(
              color: Colors.red[100],
              child: Foo(_key),
            );
          default:
            throw "404";
        }
      },
    );
  }
}

class Foo extends StatefulWidget {
  @override
  _FooState createState() => _FooState();

  Foo(key) : super(key: key);
}

class _FooState extends State<Foo> {
  bool _switchValue = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _switchValue,
          onChanged: (v) {
            setState(() => _switchValue = v);
          },
        ),
        Slider(
          value: _sliderValue,
          onChanged: (v) {
            setState(() => _sliderValue = v);
          },
        )
      ],
    );
  }
}
