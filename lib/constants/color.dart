import 'dart:math';

import 'package:flutter/material.dart';

final Color colorBlack = Color(0xFF1A1E21);
final Color colorDark = Color(0xFF272E32);
final Color colorLight = Color(0xFFE5E1DE);
final Color colorYellow = Color(0xFFFFEE1F);
final Color colorBlue = Color(0xFF0066FF);

class ColorGenerator {
  Color random, contrast;
  
  ColorGenerator() {
    Random random = new Random();
    this.random = getColor(random);
    this.contrast = getContrast(this.random);
  }
  Color getColor(Random random) {
    Color color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
    return color;
  }

  Color getContrast(Color color) {
    if (color == null) color = Colors.transparent;
    final Color some =
        color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return some;
  }
}
