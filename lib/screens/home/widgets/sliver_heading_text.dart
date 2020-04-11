import 'package:atheneum/constants/color.dart';
import 'package:flutter/material.dart';

class SliverHeadingText extends StatelessWidget {
  const SliverHeadingText({
    Key key,
    this.text
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18,
              color: colorLight,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

