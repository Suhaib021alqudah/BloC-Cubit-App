import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickandmorbloc/core/constants/app_colors.dart';

class AppTextStyle {
  late Color styleColor;
  static TextStyle headTextStyle = GoogleFonts.epilogue(
    fontSize: 22.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w900,
    letterSpacing: 2.93,
  );

  static TextStyle pageNameStyle = GoogleFonts.epilogue(
    fontSize: 37.sp,
    color: AppColors.lightGreen,
    fontWeight: FontWeight.w900,
    letterSpacing: 2.93,
  );

  static TextStyle labelTextStyle = GoogleFonts.epilogue(
    fontSize: 17.3.sp,
    color: AppColors.labelColor,
    fontWeight: FontWeight.w900,
    letterSpacing: 2.93,
  );

  static TextStyle listTextStyle = GoogleFonts.nunito(
    fontSize: 14.sp,
    color: AppColors.lightGreen,
  );
}
