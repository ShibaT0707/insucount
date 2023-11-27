import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyTextStyles {
  static final lTitle = GoogleFonts.khand(
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: Mycolors.black,
  );

  static const mGreyText = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Mycolors.grey,
    height: 5,
  );

  static const mBlackText = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w200,
    color: Mycolors.black,
  );
  static const sBlackText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w200,
    color: Mycolors.black,
  );
  static const mwhiteText = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w200,
    color: Mycolors.white,
  );
  static const lwhiteText = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    color: Mycolors.white,
  );
  static final barTitle = GoogleFonts.khand(
    fontSize: 35,
    fontWeight: FontWeight.w400,
    color: Mycolors.black,
  );
  static const barText = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w200,
    color: Mycolors.black,
  );
}
