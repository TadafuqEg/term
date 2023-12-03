import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/helper/colors/colors.dart';

class MainScreenController extends GetxController with GetTickerProviderStateMixin{
  List mainList =["About","Services","Proficiencies"];




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
    // startAnimation();
    super.onInit();
  }

  bool uplogo = false;

  StartAnimatrion(){
    uplogo =  true;
    update();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    StartAnimatrion();
    super.onReady();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    // animationController .dispose();
    super.dispose();
  }
}
class MainScreenAnimatedControoler extends GetxController with GetTickerProviderStateMixin{
  bool uplogo = false;
  double scale = 3.0;
  bool isplay=false;
  late AnimationController animationController;

  startAnimation(){
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this);
  }

  StartAnimatrion(){
    uplogo =  true;
    scale = 1.0;
    update();
  }

  double xOffset=0;
  double yOffset=0;
  double scaleFactor=1;
  openSideMenu(){
    xOffset = 240;
    yOffset = 150;
    scaleFactor= 0.6;
    update();
  }
  hideSideMenu(){
    xOffset = 0;
    yOffset = 0;
    scaleFactor= 1;
    update();
  }
  Color containerColor = kSecandrycolor;
  void startAnimationLoop() {
    const duration = const Duration(milliseconds:300);
    Timer.periodic(duration, (Timer timer) {
      // Change container properties for animation
      containerColor = containerColor ==kSecandrycolor? kSecandrycolor.withOpacity(0.8) : kSecandrycolor;
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
     startAnimation();
     startAnimationLoop();
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    animationController .dispose();
    super.dispose();
  }

 @override
  void onReady() {
    // TODO: implement onReady
   StartAnimatrion();
   super.onReady();
  }


}