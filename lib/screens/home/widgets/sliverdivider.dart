import 'package:atheneum/constants/color.dart';
import 'package:flutter/material.dart';

class SliverDivider extends StatelessWidget {
  const SliverDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Divider(
        color: colorYellow,
        indent: 120,
        endIndent: 120,
        thickness: 5,
      ),
    );
  }
}
