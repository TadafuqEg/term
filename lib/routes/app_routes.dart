part of 'app_pages.dart';

abstract class Routes{
  Routes._();
  static const HOME= _Paths.HOME;
  static const ABOUT= _Paths.ABOUT;
  static const INTRODUCTION= _Paths.INTRODUCTION;
  static const MAINSCREEN= _Paths.MAINSCREEN;
  static const SERVICES= _Paths.SERVICES;
  static const PROFICIENCIES= _Paths.PROFICIENCIES;
  static const SERVICESDETAILES= _Paths.SERVICESDETAILES;
  static const SIDEMENU= _Paths.SIDEMENU;
  static const CONTACTUS= _Paths.CONTACTUS;
  static const CHECKLIST= _Paths.CHECKLIST;
  //ProficienciesSrceen
}

abstract class _Paths{
  static const HOME = '/home';
  static const ABOUT = '/about';
  static const INTRODUCTION = '/introdution';
  static const MAINSCREEN = '/mainScreen';
  static const SERVICES= '/servicesScreen';
  static const PROFICIENCIES= '/proficiencies';
  static const SERVICESDETAILES= '/servicesdetailes';
  static const SIDEMENU= '/sidemenu';
  static const CONTACTUS= '/contactus';
  static const CHECKLIST= '/checklist';


}