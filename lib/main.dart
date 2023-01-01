import 'package:flutter/material.dart';
import 'package:lazy_load/local_key_example.dart';
import 'package:lazy_load/reorder_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: ReorderableExample(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
