
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/checkList/view/screen/checkListScreen.dart';

import '../../mainScreen/mainScreen.dart';

class AnimateController extends GetxController with GetTickerProviderStateMixin{

   double height = 100;
   double width= 500;
   double heightContainer = 0.0;
   double widthContainer = 0.0;
   bool showmessage = false;
   double scale = 0;
   double radius = 0;
   bool imghide= false;
   ontap()async{
      height = 500;
     showmessage =  true;
      heightContainer= 0.6;


     // width= width==500? 800:500;
     update();
   }
   @override
  Future<void> onReady() async {
    // TODO: implement onReady
     ontap();
     super.onReady();
  }
  bool  changeStack= true;
   double imgHeight= 0;
   GotowelcomScreen()async{
     Timer(Duration(milliseconds: 1200),(){
       changeStack = false;radius= 280;
       update();
     });
     Timer(Duration(milliseconds:1800),(){
       radius= 280;
       imgHeight = double.infinity;
       scale = 4.0;
       update();
     });
     Timer(Duration(milliseconds: 3500),(){
       // imghide= true;
       Get.offAll(()=> MainScreen());
       // Get.offAll(()=> CheckListScreen());
       // update();
     });
   }
  @override
  void onInit() {
    // TODO: implement onInit
    GotowelcomScreen();
    super.onInit();
  }


}