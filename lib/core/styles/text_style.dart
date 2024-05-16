import 'package:flutter/material.dart';

class StyleText {
  // custom
  static TextStyle get size18Bold500 => _textStyle(FontWeight.w500, 18);
  static TextStyle get size16Bold700 => _textStyle(FontWeight.w700, 16);
  static TextStyle get size22Bold700 => _textStyle(FontWeight.w700, 22);
  static TextStyle get size15Bold700 => _textStyle(FontWeight.w700, 15);
  static TextStyle get size13Bold700 => _textStyle(FontWeight.w700, 13);
  static TextStyle get size15Bold500 => _textStyle(FontWeight.w500, 15);
  static TextStyle get size13Bold500 => _textStyle(FontWeight.w500, 13);
  static TextStyle get size12Bold500 => _textStyle(FontWeight.w500, 12);
  static TextStyle get size18Bold700 => _textStyle(FontWeight.w700, 18);
  static TextStyle get size16Bold500 => _textStyle(FontWeight.w500, 16);
  static TextStyle get size24Bold900 => _textStyle(FontWeight.w900, 24);
  static TextStyle get size20Bold900 => _textStyle(FontWeight.w900, 20);
  static TextStyle get size20BoldItalic => _textStyle(FontWeight.w700, 20);

  static TextStyle _textStyle(
    FontWeight weight,
    double size,
  ) =>
      TextStyle(fontSize: size, fontWeight: weight, decoration: TextDecoration.none);

  static TextStyle colorizeTextStyle = const TextStyle(fontSize: 35.0, fontWeight: FontWeight.w700);
}
