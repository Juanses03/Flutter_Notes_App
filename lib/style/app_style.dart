import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static const Color bgColor = Color.fromARGB(255, 255, 255, 255);
  static const Color mainColor = Color.fromARGB(255, 14, 44, 65);
  static const Color accentColor = Color.fromARGB(255, 96, 96, 255);

  static List<Color> cardsColor = [
    Color(0xffF3E5F5),
    Color(0xffE1BEE7),
    Color(0xffCE93D8),
    Color(0xffBA68C8),
    Color(0xffAB47BC),
    Color(0xff9C27B0),
    Color(0xff8E24AA),
    Color(0xff7B1FA2),
  ];

  static TextStyle mainTittle = GoogleFonts.roboto(
      fontSize: 18.0, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16.0, fontWeight: FontWeight.normal);

  static TextStyle dateTittle =
      GoogleFonts.roboto(fontSize: 13.0, fontWeight: FontWeight.w500);
}
