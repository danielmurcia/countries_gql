import 'package:countries_gql/presentation/common/colors.dart';
import 'package:countries_gql/presentation/common/fonts.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      fontFamily: "SourceSansPro",
      brightness: Brightness.light,
      canvasColor: Colors.white,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        primaryVariant: AppColors.primary,
        secondary: AppColors.secondary,
        secondaryVariant: AppColors.secondary,
        error: Colors.redAccent,
        surface: AppColors.lightGrey,
        onPrimary: AppColors.lightGrey,
        onSecondary: AppColors.lightGrey,
        onError: AppColors.lightGrey,
        onBackground: AppColors.darkGrey,
        onSurface: AppColors.grey,
        background: AppColors.lightGrey,
      ),
      textTheme: TextTheme(
        headline1: AppFonts.headline,
        bodyText1: AppFonts.bodyText1,
        bodyText2: AppFonts.bodyText2,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.secondary,
      ));
}
