import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/about/controller/aboutcontroller.dart';
import 'package:term/Feutcher/view/screens/about/model/about_model.dart';
import 'package:term/helper/contstant/scalesize.dart';

import '../../../../../../helper/colors/colors.dart';
import '../../../mainScreen/controller/mainScreenController/mainScreenController.dart';
import '../../../side_menu/view/Screen/sied_menu.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: (){
        _key.currentState!.openDrawer();
        // Get.toNamed('/sidemenu');
      },icon: Icon(Icons.dashboard_rounded,color: kSecandrycolor,size: 35,),
      ),
        actions: [Image.asset(
          'assets/images/logoWO.webp',
          height: width * 0.13,
        ),],

      ),
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
                      }, isActive: 'ABOUT', ),
                ],
              ),
            );
          }
      ),
      body: SafeArea(
          child: GetBuilder<AboutController>(
        init: AboutController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 40),
                    // height: height * 0.9,
                    width: double.infinity,
                    child: PageView.builder(
                        controller: controller.pageController ,
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (int index) {
                          controller.onPageChanged(index);
                        },
                        itemCount: aboutList.length,
                        itemBuilder: (context, index) {
                          return ListView(

                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.only(top: 100.0),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // shrinkWrap: true,
                                  children: [
                                    aboutList[index].title != null
                                        ? Center(
                                            child: Text(
                                              '${aboutList[index].title}',
                                              textAlign: TextAlign.center,
                                              textScaleFactor: ScaleSize.textScaleFactor(context),
                                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,fontSize: width* 0.06),
                                            ),
                                          )
                                        : Container(),
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.all(25),
                                        child: Text(
                                          '${aboutList[index].description}',
                                          textAlign: TextAlign.center,
                                            textScaleFactor: ScaleSize.textScaleFactor(context),
                                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white,fontSize: width* 0.03,fontWeight: FontWeight.w200)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                              aboutList.length,
                              (index) => AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    margin: EdgeInsets.only(
                                        right: 20,
                                        left: 20,
                                        bottom: 0,
                                        top: 0),
                                    height: controller.currentIndex == index
                                        ? 35
                                        : 15,
                                    width: controller.currentIndex == index
                                        ? 35
                                        : 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: kSecandrycolor,width: controller.currentIndex == index?0: 2),
                                      color: kSecandrycolor,
                                    ),
                                  )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed:controller.currentIndex ==0?null: () {
                                controller.pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeOutQuart);
                              },
                              icon: Icon(
                                Icons.arrow_left_rounded,
                                color: controller.currentIndex ==0? Colors.grey.withOpacity(0.1): kSecandrycolor,
                                size: 120,
                              ),
                            ),
                          ),
                          Expanded(
                            child: CircleAvatar(
                              backgroundColor: kSecandrycolor,
                              radius: 100,
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.black,

                                child: Text(
                                  'About',
                                  textScaleFactor: ScaleSize.textScaleFactor(context),
                                  style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,),
                                ),
                              ),
                            )
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: controller.currentIndex == aboutList.length -1?null:(){
                                controller.pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeOutQuart);
                              },
                              icon: Icon(
                                Icons.arrow_right_rounded,
                                color: controller.currentIndex == aboutList.length -1?Colors.grey.withOpacity(0.1):kSecandrycolor,
                                size: 120,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      )),
    );
  }
}
/*

 */
