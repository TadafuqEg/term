  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:get/get_connect/http/src/utils/utils.dart';
  import 'package:lottie/lottie.dart';
  import 'package:term/Feutcher/view/screens/introduction/controller/animationcontroller.dart';
  import 'package:term/helper/colors/colors.dart';

  class IntroductonScreen extends StatelessWidget {
    const IntroductonScreen({super.key});

    @override
    Widget build(BuildContext context) {
      var size, height, width;
      size = MediaQuery.of(context).size;
      height = size.height;
      width = size.width;
      return Scaffold(
          backgroundColor: kbackGroundcolor,
          body: GetBuilder<AnimateController>(
            init: AnimateController(),
            builder: (animtController) {
              return animtController.changeStack?Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedAlign(
                      // bottom: animtController.showmessage ? 360 : -100,
                      // //   bottom: 360,
                      // left: 120,
                      alignment: animtController.showmessage?Alignment.center: Alignment.bottomCenter,
                      child:Container(
                        padding: EdgeInsets.all(85),
                        margin: EdgeInsets.only(bottom:200),
                        child: Image.asset(
                          'assets/images/logoWO.webp',
                          width: 400,
                          height: 400,
                        ),
                      ),
                      duration: Duration(milliseconds: 600)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedSize(
                        duration: Duration(milliseconds: 375),
                        child: Image.asset(
                          'assets/images/montaine.webp',
                          height: animtController.height,
                          width: double.infinity,
                          // alignment: Alignment.center,
                          fit: BoxFit.cover,
                        )),
                  ),
                  AnimatedPositioned(
                      bottom: 100,
                      left: animtController.showmessage ? 10 : -200,
                      child: Text(
                        'Tadafuq Information\nTechnology and Elka',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,fontSize: 8),
                      ),
                      duration: Duration(milliseconds: 750)),
                  AnimatedPositioned(
                      bottom: 100,
                      right: animtController.showmessage ? 10 : -200,
                      child: Text(
                        'Join Forces to\nCreate a New Era',
                        style:Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white,fontSize: 8),
                      ),
                      duration: Duration(milliseconds: 750)),

                  AnimatedAlign(
                    // bottom: 80,
                      alignment: animtController.showmessage ? Alignment.bottomCenter: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'Powered by Tadafuq',
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5),fontSize: 8),
                        ),
                      ),
                      duration: Duration(milliseconds: 750)),
                ],
              ):
              Scaffold(
                backgroundColor: kbackGroundcolor,
                body: Stack(
                  children: [

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(85),
                        margin: EdgeInsets.only(bottom: 200),
                        child: Image.asset(
                          'assets/images/logoWO.webp',
                          width: 400,
                          height: 400,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AnimatedScale(
                        scale: animtController.scale,
                        duration: Duration(milliseconds: 1000),
                        child:
                        Container(
                          padding: EdgeInsets.all(100),
                          margin: EdgeInsets.only(bottom:50),
                          // height: animtController.imgHeight,
                          // width: animtController.imgHeight,
                          decoration: BoxDecoration(
                            color: kSecandrycolor,
                            shape: BoxShape.circle
                          ),
                          child:Image.asset('assets/images/logow.webp',width:60,height: 60,fit: BoxFit.contain,

                          )
                        ),
                      ),
                    ),


                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedSize(
                          duration: Duration(milliseconds: 375),
                          child: Image.asset(
                            'assets/images/montaine.webp',
                            height: animtController.height,
                            width: double.infinity,
                            // alignment: Alignment.center,
                            fit: BoxFit.cover,
                          )),
                    ),
                    AnimatedPositioned(
                        bottom: 100,
                        left: animtController.showmessage ? 10 : -200,
                        child: Text(
                          'Tadafuq Information\nTechnology and Elka',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,fontSize: 8),
                        ),
                        duration: Duration(milliseconds: 750)),
                    AnimatedPositioned(
                        bottom: 100,
                        right: animtController.showmessage ? 10 : -200,
                        child: Text(
                          'Join Forces to\nCreate a New Era',
                          style:Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white,fontSize: 8),
                        ),
                        duration: Duration(milliseconds: 750)),

                    AnimatedAlign(
                        // bottom: 80,
                        alignment: animtController.showmessage ? Alignment.bottomCenter: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            'Powered by Tadafuq',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5),fontSize: 8),
                          ),
                        ),
                        duration: Duration(milliseconds: 750)),
                  ],
                ),
              );
            },
          ));
    }
  }
