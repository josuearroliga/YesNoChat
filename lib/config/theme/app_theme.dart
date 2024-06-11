import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [
  _customColor,
  Colors.teal,
  Colors.orange,
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.brown
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = -0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be within 0 and ${_colorThemes.length - 1}');

  theme() {
    return ThemeData(
      colorSchemeSeed:
          _colorThemes[selectedColor], /* brightness: Brightness.dark */
    );
  }
}
