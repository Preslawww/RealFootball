import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {
  const Colors();

  static const Color mainColor = const Color(0xFF212121);
  static const Color secondColor = const Color(0xFF212121);
  static const Color grey = const Color(0xFFE5E5E5);
  static const Color background = const Color(0xFF212121);
  static const Color BottomNavbackground_ = const Color(0xFF212121);
  static const Color titleColor = const Color.fromARGB(255, 49, 217, 7);
  static const primaryGradient = const LinearGradient(
    colors: const [
      Color.fromARGB(255, 49, 217, 7),
      Color.fromARGB(255, 49, 217, 7)
    ],
    stops: const [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
