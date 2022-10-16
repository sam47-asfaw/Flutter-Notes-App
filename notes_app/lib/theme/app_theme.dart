import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppTheme{

  static Color primaryColor = Color(0xFF000633);
  static Color bgColor = Color(0xFFe2e2ff);
  static Color accentColor = Color(0xFFFFFFFF);

  //card colors
static List<Color> cardColors = [
  Colors.white,
  Colors.red.shade50,
  Colors.pink.shade100,
  Colors.orange.shade100,
  Colors.indigo.shade100,
  Colors.blue.shade100,
  Colors.blueGrey.shade100,
];

//text theme
  static TextStyle mainTitleTheme =
      GoogleFonts.poppins(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      );
  static TextStyle mainContentTheme =
    GoogleFonts.nunito(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
  );

  static TextStyle dateTitleTheme =
  GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
  );
}