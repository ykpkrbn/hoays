import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoays/utils/colors.dart';

class MyTextStyle{

 static TextStyle lato({double? fontSize,FontWeight? fontWeight,Color? color}){
   return GoogleFonts.lato(
     fontSize: fontSize ?? 16,
     fontWeight: fontWeight ?? FontWeight.w400,
     letterSpacing: 1.2,
     color: color,
   );
}

 static TextStyle poppins({double? fontSize,FontWeight? fontWeight,Color? color}){
   return GoogleFonts.poppins(
     fontSize: fontSize ?? 14,
     fontWeight: fontWeight ?? FontWeight.w600,
     letterSpacing: 1.2,
     color: color,
   );
 }

 static TextStyle lexend({double? fontSize,FontWeight? fontWeight,Color? color}){
   return GoogleFonts.lexend(
     fontSize: fontSize ?? 14,
     fontWeight: fontWeight ?? FontWeight.w600,
     letterSpacing: 1.2,
     color: color ?? MyColors.lexendColor,
   );
 }

 static TextStyle publicSans({double? fontSize,FontWeight? fontWeight,Color? color}){
   return GoogleFonts.publicSans(
     fontSize: fontSize ?? 16,
     fontWeight: fontWeight ?? FontWeight.w600,
     letterSpacing: 1.2,
     color: color ?? MyColors.lexendColor,
   );
 }

}