import 'package:bs_23/application.dart';
import 'package:bs_23/core/utils/initializer.dart';
import 'package:flutter/material.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const Application());
  });
}


