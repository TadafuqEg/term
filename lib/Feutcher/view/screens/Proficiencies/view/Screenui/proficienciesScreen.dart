import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/Proficiencies/controller/proficienciesContr.dart';
import 'package:term/Feutcher/view/screens/Proficiencies/model/Proficienciesmodel.dart';
import 'package:term/Feutcher/view/screens/Proficiencies/view/widgits/container/container.dart';
import 'package:term/Feutcher/view/screens/mainScreen/controller/mainScreenController/mainScreenController.dart';
import 'package:term/helper/colors/colors.dart';

import '../../../side_menu/view/Screen/sied_menu.dart';

class ProficienciesSrceen extends StatelessWidget {
  const ProficienciesSrceen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
    key: _key,
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
      backgroundColor: Colors.black,
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
                    }, isActive: 'PROFICIENCIES', ),
                ],
              ),
            );
          }
      ),
      body: SafeArea(
          child: GetBuilder<ProficienciesController>(
        init: ProficienciesController(),
        builder: (controller) {
          return Stack(
            children: [
              Column(
                children: [

                  Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: PageView.builder(
                            controller: controller.pageController,
                            physics: NeverScrollableScrollPhysics(),
                            onPageChanged: (int index) {
                              controller.onPageChanged(index);
                            },
                            itemCount: proficienciesList.length,
                            itemBuilder: (context, index) {
                              return RawScrollbar(
                                // isAlwaysShown: true, //always show scrollbar
                                thickness: 4,
                                //width of scrollbar
                                radius: Radius.circular(20),
                                //corner radius of scrollbar
                                scrollbarOrientation: ScrollbarOrientation.right,
                                thumbVisibility: true,
                                thumbColor: kSecandrycolor.withOpacity(0.1),
                                child: ListView.builder(
                                    itemCount:
                                        proficienciesList[index].data!.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      return DateProficListWidget(
                                        title: proficienciesList[index]
                                            .data![i]
                                            .title,
                                        Descpriton: proficienciesList[index]
                                            .data![i]
                                            .description,
                                      );
                                    }),
                              );
                            }),
                      )),
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
                              // /*
                              children: List.generate(
                                  proficienciesList.length,
                                  (index) => AnimatedContainer(
                                        duration: Duration(milliseconds: 400),
                                        margin: EdgeInsets.only(
                                            right: 20,
                                            left: 20,
                                            bottom:
                                                0,
                                            top:
                                                controller.currentIndex == index
                                                    ? 0
                                                    : 10),
                                        height: controller.currentIndex == index
                                            ? 35
                                            : 15,
                                        width: controller.currentIndex == index
                                            ? 35
                                            : 15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: kSecandrycolor,
                                              width: controller.currentIndex ==
                                                      index
                                                  ? 0
                                                  : 2),
                                          color: kSecandrycolor,
                                        ),
                                      )),

                              // */
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: controller.currentIndex == 0
                                      ? null
                                      : () {
                                          controller.pageController
                                              .previousPage(
                                                  duration: Duration(
                                                      milliseconds: 800),
                                                  curve: Curves.easeOutQuart);
                                        },
                                  icon: Icon(
                                    Icons.arrow_left_rounded,
                                    color: controller.currentIndex == 0
                                        ? Colors.grey.withOpacity(0.1)
                                        : kSecandrycolor,
                                    size: 120,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  backgroundColor: kSecandrycolor,
                                  radius: 80,
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      'Proficiencies',
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white)
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: controller.currentIndex ==
                                          proficienciesList.length - 1
                                      ? null
                                      : () {
                                          controller.pageController.nextPage(
                                              duration:
                                                  Duration(milliseconds: 800),
                                              curve: Curves.easeOutQuart);
                                        },
                                  icon: Icon(
                                    Icons.arrow_right_rounded,
                                    color: controller.currentIndex ==
                                            proficienciesList.length - 1
                                        ? Colors.grey.withOpacity(0.1)
                                        : kSecandrycolor,
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
              ),

            ],
          );
        },
      )),
    );
  }
}
