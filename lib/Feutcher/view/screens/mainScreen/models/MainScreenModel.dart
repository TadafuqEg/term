import 'package:flutter/cupertino.dart';
import 'package:term/Feutcher/view/screens/about/view/screenui/AboutScreen.dart';

class MainScreenModel{
  String ?title;
  String ? route;
  MainScreenModel({
    this.title,
    this.route
});
}
List<MainScreenModel> mainScreenList=[
  MainScreenModel(title: 'About',
      route: '/about'
  ),
  MainScreenModel(
    title: 'Services',
    route: '/servicesScreen'
  ) ,
  MainScreenModel(
    title: 'Proficiencies',
    route: '/proficiencies'
  )
];