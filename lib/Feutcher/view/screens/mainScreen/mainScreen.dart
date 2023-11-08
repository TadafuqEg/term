import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/about/view/screenui/AboutScreen.dart';
import 'package:term/Feutcher/view/screens/mainScreen/controller/mainScreenController/mainScreenController.dart';
import 'package:term/Feutcher/view/screens/mainScreen/models/MainScreenModel.dart';
import 'package:term/Feutcher/view/screens/side_menu/view/Screen/sied_menu.dart';
import 'package:term/helper/colors/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      drawer: SideMenuScreen(),
      body: AnimatedContainer(
        // transform: Matrix4.translationValues(x, y, z),
        duration: Duration(milliseconds: 1000),
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
                      if(controller.isplay==false){
                        controller.animationController.forward();
                        controller.isplay= true;
                      }else{
                        controller.animationController.reverse();
                        controller.isplay= false;
                      }
                      // Get.toNamed('/sidemenu');
                    },icon: AnimatedIcon(
                      icon:AnimatedIcons.menu_close,
                      color: Colors.white,
                      progress: controller.animationController,
                      ),));
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
                              width: width *0.42,
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
                                        child: AutoSizeText(
                                          '${mainScreenList[index].title}',

                                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                                          textAlign: TextAlign.center,
                                          minFontSize: 10,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
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
          ],
        ),
      ),
    );
  }
}
