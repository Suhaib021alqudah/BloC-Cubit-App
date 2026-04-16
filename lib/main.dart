import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickandmorbloc/core/routing/app_routes.dart';
import 'package:rickandmorbloc/core/routing/router_gen.dart';

void main() {
  runApp(RickAndMory(appRoutes: RouterGenerate()));
}

class RickAndMory extends StatelessWidget {
  const RickAndMory({super.key, required this.appRoutes});

  final RouterGenerate appRoutes;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(390, 964),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoutes.generateRoute,
          initialRoute: AppRoutes.charactersScreen,
        );
      },
    );
  }
}
