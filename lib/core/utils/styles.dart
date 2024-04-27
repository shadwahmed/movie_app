
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFonts {
  static ThemeData MyTheme = ThemeData(
    textTheme: TextTheme(
        // bodyLarge: GoogleFonts.elMessiri(
        //   fontSize: 25,
        //   fontWeight: FontWeight.w600,
        // ),
        // bodyMedium: GoogleFonts.elMessiri(
        //   color: Colors.black87,
        //   fontSize: 22,
        // ),
        bodySmall: GoogleFonts.inter(
          fontSize: 8,
          fontWeight: FontWeight.w400,
        )
    ),
  );
}
