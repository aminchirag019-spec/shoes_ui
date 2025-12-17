import 'package:flutter/material.dart';

class size {
  static late double height;
  static late double width;

  static void init(BuildContext context) {

    final mediaQuery =MediaQuery.of(context);
    height= mediaQuery.size.height;
    width= mediaQuery.size.width;
  }
}