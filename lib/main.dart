import 'package:flutter/material.dart';
import 'package:lazy_load/page_storage_key_scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: PageStorageKeyScrollExample(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
