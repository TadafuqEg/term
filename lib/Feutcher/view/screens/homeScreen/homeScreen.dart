import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/controller/HomeScreenController/homeController.dart';
import 'package:term/Feutcher/view/widgits/backgroundCircle/backgroundcircle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery
        .of(context)
        .size;
    height = size.height;
    width = size.width;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.decelerate,
                  height: controller.isContainerVisiblae ? width * 0.9 : 0.0,
                  width: controller.isContainerVisiblae ? width * 0.9 : 0.0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      BackGroundCircle(
                          circleBorderWidth: 80.0,
                          circleColor: Colors.white,
                          circleOpacity: 0.1,
                          circleWidth: width * 0.9),
                      BackGroundCircle(
                          circleBorderWidth: 40.0,
                          circleColor: Colors.white,
                          circleOpacity: 0.99,
                          circleWidth: width * 0.8),
                      SlideTransition(position:
                      Tween<Offset>(
                          begin: Offset(0.0, -0.15), end: Offset(0.0, 0.15))
                          .animate(controller.animationController),
                        child: Image.asset(
                          'assets/images/logoO.webp', width: width * 0.7,),

                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.05,),
                Container(
                  margin: EdgeInsets.all(16),
                  child: Text('Tadafuq Information Technology and Elka',
                  textAlign: TextAlign.center,
                  style: Theme
                      .of(context)
                      .textTheme.titleLarge!
                      .merge(TextStyle(color: Color(0xfff84e02),fontSize: 18,fontWeight: FontWeight.w800),)),
                ),
                Text('Join Forces to Create a New Era',
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme.titleLarge!
                    .merge(TextStyle(color: Color(0xffec7a42),fontSize: 16,fontWeight: FontWeight.w700),)),
              ],
            ),
          );
        });
  }
}
