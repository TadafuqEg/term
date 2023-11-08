import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/side_menu/view/widgets/btnContainer.dart';
import 'package:term/helper/colors/colors.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery
        .of(context)
        .size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width:width*0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kSecandrycolor.withOpacity(0.4)
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // children: [
              //   Container(
              //     margin: EdgeInsets.only(left:16,top: 10),
              //     // width: double.infinity,
              //     child: Image.asset(
              //       'assets/images/logow.webp',
              //       width: width * 0.2,
              //     ),
              //   ),
              //   IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.clear,color: Colors.white,size: 30,))
              // ],
              // ),
              SizedBox(height: 90,),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: kbackGroundcolor
                ),
                child: Column(
                  children: [
                    BtnContainerSideMenu(isActive: true,title:'Home',icon: Icons.home_max_sharp,),
                    BtnContainerSideMenu(isActive: false,title:'ABOUT US',icon: Icons.info_rounded,),
                    BtnContainerSideMenu(isActive: false,title:'PROJECTS',icon: Icons.auto_awesome_motion_rounded,),
                    BtnContainerSideMenu(isActive: false,title:'CONTACT',icon: Icons.contacts,),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: kbackGroundcolor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("LET'S TALK",style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),),
                  Icon(Icons.mail,color: Colors.white,)
                  ],
                ),
              ),
              Spacer(),
              Align(alignment: Alignment.bottomCenter,
              child: Text(

                'Powered by\nTadafuq',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,),
                textAlign: TextAlign.center,
              ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
