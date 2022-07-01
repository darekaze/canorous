import 'package:flutter/material.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iphonex = MediaQuery.of(context).size.height >= 812.0;
    final bottomPadding = iphonex ? 16.0 : 0.0;
    return SliverToBoxAdapter(
      child: Container(height: 50 + bottomPadding),
    );
  }
}
