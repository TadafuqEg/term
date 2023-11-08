import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/services/View/widgets/Container/container.dart';
import 'package:term/Feutcher/view/screens/services/View/widgets/Container/containerDetailes.dart';
import 'package:term/Feutcher/view/screens/services/controller/ServiceDetController.dart';
import 'package:term/helper/colors/colors.dart';

class Servicedetailes extends StatelessWidget {
  const Servicedetailes({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<ServiceDetController>(
        init: ServiceDetController(),
        builder: (controller) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  controller.selectdata[0].imgsrc,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              SafeArea(
                  child: Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Image.asset(
                      'assets/images/logoWO.webp',
                      width: width * 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Flexible(
                      flex: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(child: ContainerServices()),
                          Flexible(
                              child: ServiceDetaielsCont(
                            txt: controller.selectdata[0].name,
                          ))
                        ],
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        height: width * 0.6,
                        decoration: BoxDecoration(
                          // color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(25),
                          // border: Border.all(color: kSecandrycolor.withOpacity(0.1),width: 3)
                        ),
                        margin: EdgeInsets.all(35),
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: 0,
                                child: Text(
                                  '${controller.selectdata[0].title}',
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                                )),
                            Flexible(
                              flex: 2,
                              child:RawScrollbar(
                                  // isAlwaysShown: true, //always show scrollbar
                                  thickness: 10,
                                  //width of scrollbar
                                  radius: Radius.circular(20),
                                  //corner radius of scrollbar
                                  scrollbarOrientation:
                                      ScrollbarOrientation.right,
                                  thumbVisibility: true,
                                  thumbColor: kSecandrycolor.withOpacity(0.5),

                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 10.0, right: 10),
                                          child: DefaultTextStyle(
                                            style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
                                            child:
                                                AnimatedTextKit(
                                                  totalRepeatCount: 1,
                                              repeatForever: false,
                                              animatedTexts: [
                                              TypewriterAnimatedText(controller
                                                  .selectdata[0].description,
                                                speed: const Duration(milliseconds: 30),
                                              ),
                                            ],


                                                ),
                                          )

                                          /*
                                        Text(
                                          '${controller.selectdata[0].description}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.52,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.w400,

                                          ),
                                        ),
                                          */
                                          ),
                                    ],
                                  ),
                                ),

                            )
                          ],
                        ),
                      ))
                ],
              )),
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
      ),
    );
  }
}
