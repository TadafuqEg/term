import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/about/view/screenui/AboutScreen.dart';
import 'package:term/Feutcher/view/screens/checkList/view/screen/checkListScreen.dart';
import 'package:term/Feutcher/view/screens/checkanotherlist/view/Screen/xchecklistScreen.dart';
import 'package:term/Feutcher/view/screens/mainScreen/controller/mainScreenController/mainScreenController.dart';
import 'package:term/Feutcher/view/screens/mainScreen/models/MainScreenModel.dart';
import 'package:term/Feutcher/view/screens/side_menu/view/Screen/sied_menu.dart';
import 'package:term/helper/colors/colors.dart';
import 'dart:ui' show ImageFilter;

import 'package:term/helper/contstant/scalesize.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Stack(
      children: [
        Container(
          child: Image.asset(
            'assets/images/mainbackground.webp',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Scaffold(
          key: _key,
          // drawerEnableOpenDragGesture: true,
          drawerEnableOpenDragGesture: false,

          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          drawer: GetBuilder<MainScreenAnimatedControoler>(
            init:MainScreenAnimatedControoler() ,
            builder: (anim_controller) {
              return GestureDetector(
                onHorizontalDragEnd:(details){
                  if (details.velocity.pixelsPerSecond.dx > 0) {
                    return;
                  }_key.currentState!.openDrawer();
                } ,
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 7.0,
                        sigmaY: 7.0,
                      ),
                      child: const SizedBox.expand(),
                    ),
                    SideMenuScreen(

                        icon:Icon(Icons.close,color: Colors.white,size: 35,),
                        press:(){
                          _key.currentState!.closeDrawer();

                          // Get.toNamed('/sidemenu');
                    } ,
                    isActive: 'Home',
                    ),

                  ],
                ),
              );
            }
          ),
          body: GetBuilder< MainScreenAnimatedControoler>(
            init:  MainScreenAnimatedControoler(),
            builder: (anim_controller) {
              return AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25)
                ),
                transform: Matrix4.translationValues(anim_controller.xOffset, anim_controller.yOffset, 0)..scale(anim_controller.scaleFactor),
                duration: Duration(milliseconds: 150),
                child: Stack(
                  children: [
                    GetBuilder<MainScreenAnimatedControoler>(
                        init: MainScreenAnimatedControoler(),
                        builder: (controller){
                          return  AnimatedScale(
                            duration: Duration(milliseconds: 1000),
                            scale: controller.scale,
                            child:Image.asset(
                              'assets/images/mainbackground.webp',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ) ,);
                        }),
                    GetBuilder<MainScreenController>(
                      init: MainScreenController(),
                      builder: (controller) {
                        return Positioned(
                            top: 40,
                            left: 20,
                            child: IconButton(onPressed: (){
                              _key.currentState!.openDrawer();
                              // Get.toNamed('/sidemenu');
                            },icon: Icon(Icons.dashboard_rounded,color: kSecandrycolor,size: 35,),
                            ));
                      }
                    ),
                    GetBuilder<MainScreenAnimatedControoler>(
                        init: MainScreenAnimatedControoler(),
                        builder: (controller){
                          return AnimatedAlign(
                            duration: Duration(milliseconds: 1000),
                            alignment:controller.uplogo? Alignment.topCenter:Alignment.center,
                            child: Container(
                              margin: EdgeInsets.only(top: 80),
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/logoWO.webp',
                                height: height * 0.1,
                              ),
                            ),
                          );
                        }),
                    GetBuilder<MainScreenController>(
                        init: MainScreenController(),
                        builder: (controller) {
                          return AnimatedAlign(
                            alignment:controller.uplogo?Alignment.center:Alignment.bottomCenter,
                            duration: Duration(milliseconds: 1000),
                            child: Container(
                              margin: EdgeInsets.only(bottom:controller.uplogo?300:0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed:  controller.currentIndex ==0?null:() {
                                      controller.pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeOutQuart);
                                    },
                                    icon: Icon(
                                      Icons.arrow_left_rounded,
                                      color: controller.currentIndex ==0?Colors.grey.withOpacity(0.1):kSecandrycolor,
                                      size: 100,
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: height*0.06,
                                      width: width *0.5,
                                      child: PageView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          controller: controller.pageController,
                                          onPageChanged: (index){
                                            controller.onPageChanged(index);
                                          },
                                          itemCount:mainScreenList.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                                onTap: () {
                                                  Get.toNamed('${mainScreenList[index].route}');
                                                },
                                                child: Text(
                                                  '${mainScreenList[index].title}',

                                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white,fontSize: width * 0.07),
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: ScaleSize.textScaleFactor(context),
                                                  // maxFontSize:width * 0.1,
                                                  maxLines:1,
                                                  // overflow: TextOverflow.ellipsis,
                                                ));
                                          }),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed:controller.currentIndex == mainScreenList.length -1 ?null:() {
                                      controller.pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeOutQuart);
                                    },
                                    icon: Icon(
                                      Icons.arrow_right_rounded,
                                      color: controller.currentIndex == mainScreenList.length -1?Colors.grey.withOpacity(0.1):kSecandrycolor,
                                      size: 100,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                    // SideMenuScreen()
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height*0.5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Colors.black.withOpacity(0.1), Colors.black],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Tadafuq Information\nTechnology and Elka',

                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,fontSize: width * 0.05),
                              textAlign: TextAlign.center,
                              // maxFontSize:width * 0.1,
                              textScaleFactor: ScaleSize.textScaleFactor(context),
                              maxLines:2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 16,),
                            Text(
                              'Join Forces to\nCreate a New Era',

                              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white,fontSize: width * 0.04),
                              textAlign: TextAlign.center,
                              textScaleFactor: ScaleSize.textScaleFactor(context),
                              // maxFontSize:width * 0.1,
                              maxLines:2,
                              // overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),

                      ),
                    )

                  ],
                ),
              );
            }
          ),
          floatingActionButton: FloatingActionButton(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
            ) ,
            onPressed: (){
              Get.to(()=> XCheckListScreen());
            },
            backgroundColor: Colors.transparent,
            child: GetBuilder(
              init: MainScreenAnimatedControoler(),
              builder: (contrller) {
                return AnimatedContainer(
                  decoration: BoxDecoration(color: kSecandrycolor,
                      borderRadius: BorderRadius.circular(40),
                      // border:Border.all(color: contrller.containerColor,width: 9)
                    boxShadow: [
                      BoxShadow(
                        color: contrller.containerColor,
                        spreadRadius: 8,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      )
                    ]
                  ),
                  padding: EdgeInsets.all(5),
                  duration: Duration(milliseconds: 300),
                  child: Icon(Icons.question_mark_rounded,color: Colors.white,),
                );
              }
            )
          ),
        ),


      ],
    );
  }
}
