import 'package:flutter/material.dart';

class TColor {
  static Color get primary => const Color(0xfffe6dcb); // Color principal (rosa)
  static Color get secondary => const Color(0xff3F414E); // Color secundario (gris oscuro)
  static Color get tertiary => const Color(0xffEBEAEC); // Color terciario (gris claro)

  static Color get primaryText => const Color(0xff3F414E); // Texto principal (gris oscuro)
  static Color get primaryTextW => const Color(0xffF6F1FB); // Texto en blanco
  static Color get secondaryText => const Color(0xffA1A4B2); // Texto secundario (gris suave)
  static Color get txtBG => const Color(0xffF2F3F7); // Fondo para texto (gris claro)
}

extension AppContext on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;

  Future push(Widget widget) async {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => widget));
  }

  void pop() {
    Navigator.pop(this);
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst("#", ""));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
