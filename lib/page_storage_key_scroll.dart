import 'package:flutter/material.dart';

class PageStorageKeyScrollExample extends StatelessWidget {
  const PageStorageKeyScrollExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Container(
              color: Colors.green[100],
              child: _Page(PageStorageKey('First Page')),
            );
          case 1:
            return Container(
              color: Colors.blue[100],
              child: Text("Blank Page"),
            );
          case 2:
            return Container(
              color: Colors.red[100],
              child: _Page(PageStorageKey('Second Page')),
            );
          default:
            throw "404";
        }
      },
    );
  }
}

class _Page extends StatelessWidget {
  _Page(key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('$index'),
      );
    });
  }
}
