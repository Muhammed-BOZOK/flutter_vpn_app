import 'dart:ui';

class Appcolors {
  static Color primary = fromHex('#1A5CFF');
  static Color secondaryBlue = fromHex('#3B74FF');
  static Color background = fromHex('#F2F5F9');
  static Color secondary = fromHex('#1A5CFF');
  static Color whitecolor = fromHex('#FFFFFF');
  static Color blackcolor = fromHex('#00091F');
  static Color redAccent = fromHex('#E63946');
  static Color yellowAccent = fromHex('#00D589');
  static Color blueAccent = fromHex('#185BFF');

  ///
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
