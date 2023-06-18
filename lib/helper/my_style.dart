import 'package:flutter/material.dart';
import 'package:project_dkriya/helper/my_color.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStyle {
  static TextStyle labelFormText = GoogleFonts.poppins(
      color: MyColor.primaryTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w500);

  static TextStyle titleText = GoogleFonts.poppins(
      color: MyColor.primaryTextColor,
      fontSize: 30,
      fontWeight: FontWeight.w600);

  static TextStyle formText = GoogleFonts.poppins(
      color: MyColor.formFont, fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle appBarTitle = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF191919),
  );

  static TextStyle profileMenuText = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: const Color(0xFF032630),
  );

  static TextStyle categoryText = GoogleFonts.poppins(
    fontSize: 14,
  );

  static TextStyle subTitleText =
      GoogleFonts.poppins(fontSize: 14, color: MyColor.secondaryTextColor);
}
