import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rickandmorbloc/core/constants/app_colors.dart';
import 'package:rickandmorbloc/core/constants/app_text_style.dart';
import 'package:rickandmorbloc/data/models/characters_model.dart';

class CharacterWidget extends StatefulWidget {
  const CharacterWidget({super.key, required this.character});

  final Results character;

  @override
  State<CharacterWidget> createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 234.h,
      width: 175.w,
      child: Container(
        decoration: const BoxDecoration(color: AppColors.containerColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12.r),
                child: Image.network(
                  widget.character.image ?? '',
                  height: 140.h,
                  width: 175.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image, size: 50.sp),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                mainAxisAlignment: .spaceAround,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    widget.character.name ?? 'Unknown',
                    style: AppTextStyle.characterNameTextStyle,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: widget.character.status == 'Alive'
                              ? AppColors.lightGreen
                              : Colors.red,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: widget.character.status == 'Alive'
                                  ? AppColors.lightGreen
                                  : Colors.red,
                              blurRadius: 8.r,
                            ),
                          ],
                        ),
                      ),
                      Gap(4.w),
                      Flexible(
                        child: Text(
                          '${widget.character.species ?? ''} • ${widget.character.status ?? ''}',
                          style: const TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
