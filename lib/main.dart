import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/routes/app_pages.dart';

import 'Feutcher/view/screens/homeScreen/homeScreen.dart';
import 'Feutcher/view/screens/introduction/view/introductionScrceen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TERM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFF5D3D)),
        useMaterial3: true,
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Color(0xFFFF5D3D))
        )
      ),
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
      // home: IntroductonScreen(),
    );
  }
}
