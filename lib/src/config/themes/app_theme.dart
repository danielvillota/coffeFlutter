import 'package:flutter/material.dart';

import 'package:coffe/src/utils/constants/colors.dart';

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        color: white,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: white,
      colorSchemeSeed: primary,
    );
  }
}