import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  bool isContainerVisiblae = false;
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      updateSize();
    });
    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),reverseDuration: Duration(seconds: 1)
    )..addStatusListener((AnimationStatus status) {
      if(status == AnimationStatus.completed )animationController.reverse();
      if(status == AnimationStatus.dismissed )animationController.forward();
    });
    animationController.forward();
  }

  updateSize() {
    isContainerVisiblae = true;
    update();
  }
}
