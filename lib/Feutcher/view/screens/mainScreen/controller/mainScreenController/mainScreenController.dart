import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController with GetTickerProviderStateMixin{
  List mainList =["About","Services","Proficiencies"];

  bool isplay=false;
  late AnimationController animationController;

  startAnimation(){
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this);
  }


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
    startAnimation();
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
    animationController .dispose();
    super.dispose();
  }
}
class MainScreenAnimatedControoler extends GetxController{
  bool uplogo = false;
  double scale = 3.0;
  StartAnimatrion(){
    uplogo =  true;
    scale = 1.0;
    update();
  }
 @override
  void onReady() {
    // TODO: implement onReady
   StartAnimatrion();
   super.onReady();
  }


}