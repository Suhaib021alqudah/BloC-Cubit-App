import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickandmorbloc/core/constants/app_colors.dart';
import 'package:rickandmorbloc/core/constants/app_text_style.dart';
import 'package:rickandmorbloc/presentation/screen/home_screen.dart';

class ListButton extends StatelessWidget {
  const ListButton({super.key, required this.episodeNumber});
  final String episodeNumber;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isPressd = true;
      },
      child: Container(
        width: 67.23.w,
        height: 38.h,
        decoration: BoxDecoration(
          color: isPressd ? AppColors.lightGreen : AppColors.neturalColor,
          border: Border.all(
            color: isPressd ? AppColors.lightGreen : AppColors.neturalColor,
            width: 4.r,
          ),
        ),
        child: Text(
          episodeNumber,
          style: AppTextStyle.listTextStyle.copyWith(
            color: AppColors.neturalColor,
          ),
        ),
      ),
    );
  }
}
