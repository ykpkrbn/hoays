import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoays/utils/colors.dart';
import 'package:hoays/utils/textStyle.dart';

class MyTheme {
  ///Açık Tema
  static final ThemeData acikTema = ThemeData(
    primaryColor: MyColors.orangeColor,
    scaffoldBackgroundColor: MyColors.backgroundColor,
    hoverColor: Colors.transparent,
    buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.black)),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: MyColors.backgroundColor,
      foregroundColor: MyColors.orangeColor,
      titleTextStyle: GoogleFonts.lato(
        color: MyColors.titleColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      iconTheme: const IconThemeData(color: MyColors.orangeColor, shadows: [
        Shadow(color: MyColors.orangeColor, offset: Offset(0, 0)),
        Shadow(color: MyColors.yellowColor, offset: Offset(0, 0)),
      ]),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(MyColors.orangeColor),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: MyColors.orangeColor.withOpacity(.5)
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: MyColors.inputDecorationBackgroundColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide:
            const BorderSide(color: MyColors.inputDecorationBackgroundColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide:
            const BorderSide(color: MyColors.inputDecorationBackgroundColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide: const BorderSide(color: MyColors.orangeColor),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 5,
        selectedLabelStyle: MyTextStyle.lato(fontSize: 12),
        selectedItemColor: Colors.black),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicator: BoxDecoration(
          color: MyColors.orangeColor,
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle),
    ),
  );

  /// Koyu Tema
  static final ThemeData koyuTema = ThemeData.dark().copyWith(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 5,
      selectedItemColor: Colors.white,
    ),

    /// TextFormField gibi widgetlardaki temayı düzenler
    inputDecorationTheme: InputDecorationTheme(
      fillColor: MyColors.bottomBackgroundColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide: const BorderSide(color: MyColors.bottomBackgroundColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide: const BorderSide(color: MyColors.bottomBackgroundColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide: const BorderSide(color: MyColors.orangeColor),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(MyColors.orangeColor),
    ),
    popupMenuTheme: PopupMenuThemeData(
        color: MyColors.orangeColor.withOpacity(.5)
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: GoogleFonts.lato(
        color: MyColors.grayColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
  );
}
