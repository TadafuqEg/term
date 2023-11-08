import 'package:get/get.dart';
import 'package:term/Feutcher/controller/HomeScreenController/homeController.dart';
import 'package:term/Feutcher/view/screens/about/view/screenui/AboutScreen.dart';
import 'package:term/Feutcher/view/screens/homeScreen/homeScreen.dart';
import 'package:term/Feutcher/view/screens/introduction/view/introductionScrceen.dart';
import 'package:term/Feutcher/view/screens/mainScreen/mainScreen.dart';
import 'package:term/Feutcher/view/screens/services/View/screenUI/ServicesScreen.dart';
import 'package:term/Feutcher/view/screens/services/View/screenUI/serviceDetails/servicedetailes.dart';
import 'package:term/Feutcher/view/screens/side_menu/view/Screen/sied_menu.dart';

import '../Feutcher/view/screens/Proficiencies/view/Screenui/proficienciesScreen.dart';
part 'app_routes.dart';
class AppPages{
  static final routes=[
    GetPage(name: _Paths.HOME, page: ()=>HomeScreen()),
    GetPage(name: _Paths.INTRODUCTION, page: ()=>IntroductonScreen()),
    GetPage(name: _Paths.ABOUT, page: ()=>AboutScreen()),
    GetPage(name: _Paths.MAINSCREEN, page: ()=> MainScreen()),
    GetPage(name: _Paths.SERVICES, page: ()=> ServicesScreen()),
    GetPage(name: _Paths.PROFICIENCIES, page: ()=> ProficienciesSrceen()),
    GetPage(name: _Paths.SERVICESDETAILES, page: ()=> Servicedetailes()),
    GetPage(name: _Paths.SIDEMENU, page: ()=> SideMenuScreen()),
  ];
}