import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rickandmorbloc/business_logic/cubit/rickandmory_cubit.dart';
import 'package:rickandmorbloc/core/constants/app_colors.dart';
import 'package:rickandmorbloc/core/constants/app_text_style.dart';
import 'package:rickandmorbloc/data/models/characters_model.dart';
import 'package:rickandmorbloc/presentation/widget/character_widget.dart';
import 'package:rickandmorbloc/presentation/widget/list_button.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Results> allCharacters = [];

  @override
  void initState() {
    super.initState();

    BlocProvider.of<RickandmoryCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<RickandmoryCubit, RickandmoryState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters.cast<Results>();
          return buildCharactersList();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),

      physics: const NeverScrollableScrollPhysics(),
      itemCount: allCharacters.length,
      scrollDirection: .vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CharacterWidget(character: allCharacters[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neturalColor,
      appBar: AppBar(
        backgroundColor: AppColors.neturalColor,
        elevation: 0,
        title: Text('RICK & MORTY', style: AppTextStyle.headTextStyle),

        actions: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Text('RICK & MORTY', style: AppTextStyle.headTextStyle),
                  const Spacer(),
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(15.h),
              Text('CHARACTERS', style: AppTextStyle.pageNameStyle),
              Text(
                '826 life forms catalogued',
                style: AppTextStyle.labelTextStyle,
              ),
              Gap(24.h),

              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ListButton(episodeNumber: 'Season ${index + 1}');
                  },
                ),
              ),

              Gap(24.h),
              buildBlocWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
