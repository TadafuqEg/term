import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProficienciesController extends GetxController{

  int currentIndex = 0 ;
  late PageController pageController ;
  onPageChanged(index){
    currentIndex = index;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    pageController= PageController(initialPage: 0);
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
}