import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: DataOwnerStateful()),
      ),
    );
  }
}

class DataOwnerStateful extends StatefulWidget {
  const DataOwnerStateful({Key? key}) : super(key: key);

  @override
  State<DataOwnerStateful> createState() => _DataOwnerStatefulState();
}

class _DataOwnerStatefulState extends State<DataOwnerStateful> {
  var _valueOne = 0;
  var _valueTwo = 0;

  void _incOne() {
    _valueOne += 1;
    setState(() {});
  }

  void _incTwo() {
    _valueTwo += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: _incOne, child: const Text('Inc first counter')),
        ElevatedButton(
            onPressed: _incTwo, child: const Text('Inc second counter')),
        DataProviderInherit(
            valueOne: _valueOne,
            valueTwo: _valueTwo,
            child: const DataConsumerStateless())
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contextValue = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherit>()
            ?.valueOne ??
        0;

    // findAncestorStateOfType<_DataOwnerStatefulState>()?._value ?? 0;
    return Column(
      children: [
        Text('$contextValue'),
        const DataConsumerStateful(),
      ],
    );
  }
}

class DataConsumerStateful extends StatefulWidget {
  const DataConsumerStateful({Key? key}) : super(key: key);

  @override
  State<DataConsumerStateful> createState() => _DataConsumerStatefulState();
}

class _DataConsumerStatefulState extends State<DataConsumerStateful> {
  @override
  Widget build(BuildContext context) {
    final inheritElement =
        context.getElementForInheritedWidgetOfExactType<DataProviderInherit>();
    if (inheritElement != null) {
      context.dependOnInheritedElement(inheritElement);
    }

    final widget = inheritElement?.widget as DataProviderInherit;
    final contextValue = widget.valueTwo;

    /*final contextValue =
        context.findAncestorStateOfType<_DataOwnerStatefulState>()?._value ?? 0;*/
    return Text('$contextValue');
  }
}

/*T? getInherit<T>(BuildContext context) {
  final inheritElement = context.getElementForInheritedWidgetOfExactType<T>();

  final widget = inheritElement?.widget as DataProviderInherit;

  if (widget is T) {
    return widget as T;
  } else {
    return null;
  }
}*/

class DataProviderInherit extends InheritedWidget {
  final int valueOne;
  final int valueTwo;

  const DataProviderInherit({
    super.key,
    required super.child,
    required this.valueOne,
    required this.valueTwo,
  });

  static DataProviderInherit of(BuildContext context) {
    final DataProviderInherit? result =
        context.dependOnInheritedWidgetOfExactType<DataProviderInherit>();
    assert(result != null, 'No DataProviderInherit found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DataProviderInherit old) {
    return valueOne != old.valueOne || valueTwo != old.valueTwo;
  }
}
