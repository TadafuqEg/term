import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/services/View/widgets/btn/btnservice.dart';
import 'package:term/Feutcher/view/screens/services/controller/ServiceController.dart';
import 'package:term/Feutcher/view/screens/services/model/serviceModel.dart';
import 'package:term/helper/colors/colors.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GetBuilder<ServicesController>(
          init: ServicesController(),
          builder: (controller){
            return Stack(
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 0,
                      child: Align(
                        alignment: FractionalOffset.topCenter,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/logoWO.webp',
                            height: width * 0.2,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                        fit: FlexFit.tight,
                        child: PageView.builder(
                        controller: controller.pageController ,
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (int index) {
                          controller.onPageChanged(index);
                        },
                        itemCount: serviceList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${serviceList[index].title}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                                ),
                                Flexible(
                                  child: Container(
                                    width:width*0.6,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: PageScrollPhysics(),
                                        itemCount:serviceList[index].btn!.length,
                                        itemBuilder: (context, i) {
                                          return BtnServices(
                                            onPressed: () {
                                               Get.toNamed("/servicesdetailes",arguments: {"id":serviceList[index].btn![i].id});
                                              //,arguments: {"id":"serviceList[index].btn![i].id"}
                                            },
                                            txt: '${serviceList[index].btn![i].btnTxt}',
                                          );
                                        }),
                                  ),
                                )
                              ],
                            ),
                          );
                        })),
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
                                serviceList.length,
                                    (index) => AnimatedContainer(
                                  duration: Duration(milliseconds: 400),
                                  margin: EdgeInsets.only(
                                      right: 20,
                                      left: 20,
                                      bottom:0,
                                      top: controller.currentIndex == index
                                          ? 0 : 10),
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

                            // */
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: IconButton(
                                    onPressed:
                                    controller.currentIndex ==0?null:
                                        () {
                                      controller.pageController.previousPage(duration: Duration(milliseconds: 800), curve: Curves.easeOutQuart);
                                    },
                                    icon: Icon(
                                      Icons.arrow_left_rounded,
                                      color:
                                      controller.currentIndex ==0? Colors.grey.withOpacity(0.1):
                                      kSecandrycolor,
                                      size: 120,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: CircleAvatar(
                                      backgroundColor: kSecandrycolor,
                                      radius: 100,
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundColor: Colors.black,
                                        child: Text(
                                          'Services',
                                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed:
                                    controller.currentIndex == serviceList.length -1?null:
                                        () {
                                      controller.pageController.nextPage(duration: Duration(milliseconds: 800), curve: Curves.easeOutQuart);
                                    },
                                    icon: Icon(
                                      Icons.arrow_right_rounded,
                                      color:
                                      controller.currentIndex == serviceList.length -1?Colors.grey.withOpacity(0.1):
                                      kSecandrycolor,
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
        )
      ),
    );
  }
}
