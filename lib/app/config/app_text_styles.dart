import 'package:app_pda_lda/app/config/app_color.dart';
import 'package:app_pda_lda/app/config/app_dimen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle defaultStyle = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: AppDimens.defaultSize, color: AppColors.textColor, height: 1.5));

  static TextStyle sideBar = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: AppDimens.sideBar, color: AppColors.textColor, height: 1.5));

  static TextStyle title = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: AppDimens.title, color: AppColors.textColor, height: 1.5));

  static TextStyle header = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: AppDimens.header, color: AppColors.textColor, height: 1.5));

  static TextStyle small = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: AppDimens.small, color: AppColors.textColor, height: 1.5));

  static TextStyle label = GoogleFonts.openSans(
      textStyle: TextStyle(fontSize: AppDimens.label, color: AppColors.textColor, height: 1.5));
}
