import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rickandmorbloc/core/constants/app_colors.dart';
import 'package:rickandmorbloc/core/constants/app_text_style.dart';
import 'package:rickandmorbloc/presentation/widget/list_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isPressd = false;
List<String> episodesNumber = ['S1', 'S2', 'S3', 'S4', 'S5'];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neturalColor,
      appBar: AppBar(
        backgroundColor: AppColors.neturalColor,

        actions: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('RICK & MORTY', style: AppTextStyle.headTextStyle),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 40,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .start,
              children: [
                Gap(15.h),
                Text('EPISODES', style: AppTextStyle.pageNameStyle),
                Text(
                  '7 Seasons · 71 Episodes',
                  style: AppTextStyle.labelTextStyle,
                ),
                const Gap(32),
                ListView.builder(
                  itemCount: episodesNumber.length,
                  scrollDirection: .horizontal,
                  itemBuilder: (context, index) {
                    return ListButton(episodeNumber: episodesNumber[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
