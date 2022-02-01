import 'package:countries_gql/presentation/common/colors.dart';
import 'package:flutter/material.dart';

mixin AppFonts {
  static const fontFamily = 'SourceSansPro';

  static const headline = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 22.0,
    color: AppColors.darkGrey,
  );

  static const bodyText1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    color: AppColors.darkGrey,
  );

  static const bodyText2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: AppColors.darkGrey,
  );
}
