import 'package:flutter/material.dart';

abstract final class ThreadTheme {
  static bool isDarkTheme(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark;

  static Color foregroundColor({bool isDarkMode = false}) =>
      isDarkMode ? Colors.white : Colors.black;

  static final light = _createThemeData(
    backgroundColor: Colors.white,
    foregroundColor: foregroundColor(),
    dividerColor: Colors.grey.shade300,
    listTileSubtitleColor: Colors.grey.shade700,
    bottomSheetBackgroundColor: Colors.white,
    textFieldHintTextColor: Colors.grey.shade700,
    bottomBarBackgroundColor: Colors.white,
    bottomBarForegroundColor: Colors.black,
  );

  static final dark = _createThemeData(
    backgroundColor: Colors.black,
    foregroundColor: foregroundColor(isDarkMode: true),
    dividerColor: Colors.grey.shade800,
    listTileSubtitleColor: Colors.grey.shade500,
    bottomSheetBackgroundColor: Colors.grey.shade900,
    textFieldHintTextColor: Colors.grey.shade500,
    bottomBarBackgroundColor: Colors.black,
    bottomBarForegroundColor: Colors.white,
  );

  static ThemeData _createThemeData({
    required Color backgroundColor,
    required Color foregroundColor,
    required Color dividerColor,
    required Color listTileSubtitleColor,
    required Color textFieldHintTextColor,
    required Color bottomSheetBackgroundColor,
    required Color bottomBarBackgroundColor,
    required Color bottomBarForegroundColor,
  }) {
    return ThemeData(
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        surfaceTintColor: backgroundColor,
        titleTextStyle: TextStyle(
          color: foregroundColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        shape: Border(
          bottom: BorderSide(color: dividerColor),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: bottomBarBackgroundColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: bottomBarForegroundColor,
        unselectedItemColor: Colors.grey,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: foregroundColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: foregroundColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: foregroundColor,
          fontSize: 16,
        ),
        labelMedium: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: IconThemeData(
        color: foregroundColor,
      ),
      tabBarTheme: TabBarTheme(
        labelStyle: TextStyle(
          color: foregroundColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        indicatorColor: foregroundColor,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: foregroundColor,
        titleTextStyle: TextStyle(
          color: foregroundColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        subtitleTextStyle: TextStyle(
          color: listTileSubtitleColor,
          fontSize: 16,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: dividerColor,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: bottomSheetBackgroundColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: textFieldHintTextColor,
        ),
      ),
    );
  }
}