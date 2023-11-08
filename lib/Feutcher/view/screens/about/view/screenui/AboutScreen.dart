import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/about/controller/aboutcontroller.dart';
import 'package:term/Feutcher/view/screens/about/model/about_model.dart';

import '../../../../../../helper/colors/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: GetBuilder<AboutController>(
        init: AboutController(),
        builder: (controller) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/logoWO.webp',
                      height: height * 0.1,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    height: width * 0.9,
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
                              aboutList[index].title != null
                                  ? Container(
                                      child: Text(
                                        '${aboutList[index].title}',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                                      ),
                                    )
                                  : Container(),
                              Container(
                                margin: EdgeInsets.all(25),
                                child: Text(
                                  '${aboutList[index].description}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  Expanded(
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
                                      style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
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
              ),
              Positioned(
                left: 20,
                top: 40,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
/*

 */
