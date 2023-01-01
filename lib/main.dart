import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: CustomMultiChildLayout(
          delegate: OwnCustomMultiChildLayoutDelegate(),
          children: [
            LayoutId(
                id: 1,
                child: Text(
                  "Left",
                  textDirection: TextDirection.ltr,
                )),
            LayoutId(
                id: 2,
                child: Text(
                  "Center 123123123 123 123",
                  textDirection: TextDirection.ltr,
                )),
            LayoutId(
                id: 3,
                child: Text(
                  "Right12312312312312123",
                  textDirection: TextDirection.ltr,
                )),
          ],
        ),
      ),
    );
  }
}

class OwnCustomMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.biggest.width, 100);
  }

  @override
  void performLayout(Size size) {
    if (hasChild(1) && hasChild(2) && hasChild(3)) {
      const minOtherElementsWidth = 50;

      final firstElementMaxWidth = size.width - minOtherElementsWidth * 2;
      final firstElementSize = layoutChild(
          1, BoxConstraints.loose(Size(firstElementMaxWidth, size.height)));

      final thirdElementMaxWidth =
          size.width - firstElementSize.width - minOtherElementsWidth;

      final thirdElementSize = layoutChild(
          3, BoxConstraints.loose(Size(thirdElementMaxWidth, size.height)));

      final secondElementMaxWidth =
          size.width - firstElementSize.width - thirdElementSize.width;

      final secondElementSize = layoutChild(
          2, BoxConstraints.loose(Size(secondElementMaxWidth, size.height)));

      final firstElementOffsetY = size.height / 2 - firstElementSize.height / 2;
      positionChild(1, Offset(0, firstElementOffsetY));

      final thirdElementOffsetY = size.height / 2 - thirdElementSize.height / 2;
      final thirdElementOffsetX = size.width - thirdElementSize.width;
      positionChild(3, Offset(thirdElementOffsetX, thirdElementOffsetY));

      final secondElementOffsetY =
          size.height / 2 - secondElementSize.height / 2;
      var secondElementOffsetX = size.width / 2 - secondElementSize.width / 2;
      if (firstElementSize.width > secondElementOffsetX) {
        secondElementOffsetX = firstElementSize.width;
      } else if (thirdElementOffsetX <
          secondElementOffsetX + secondElementSize.width) {
        secondElementOffsetX = thirdElementOffsetX - secondElementSize.width;
      }
      positionChild(2, Offset(secondElementOffsetX, secondElementOffsetY));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
