import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/ContactUs/Controller/ContactustControolet.dart';
import 'package:term/Feutcher/view/screens/ContactUs/view/widgets/EdtTxt/editTextMessage.dart';
import 'package:term/Feutcher/view/screens/ContactUs/view/widgets/EdtTxt/edtTextCreate.dart';
import 'package:term/Feutcher/view/screens/mainScreen/controller/mainScreenController/mainScreenController.dart';
import 'package:term/Feutcher/view/screens/services/View/widgets/btn/btnservice.dart';
import 'package:term/Feutcher/view/screens/side_menu/view/Screen/sied_menu.dart';
import 'package:term/helper/colors/colors.dart';
import 'package:term/helper/contstant/scalesize.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Stack(
      children: [
        Container(width: double.infinity,height: double.infinity,
        color: kbackGroundcolor,
        ),
        Image.asset('assets/images/contactus.webp',fit: BoxFit.fill,
        width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          bottom: -80,
          child: Image.asset('assets/images/capa.webp',
          // width: double.infinity,
          //   height: double.infinity,
          ),
        ),
        Scaffold(
          key: _key,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(onPressed: (){
              _key.currentState!.openDrawer();
              // Get.toNamed('/sidemenu');
            },icon: Icon(Icons.dashboard_rounded,color: kSecandrycolor,size: 35,),
            ),
            actions: [Container(
              margin:EdgeInsets.only(right: 16),
              child: Image.asset(
                'assets/images/logoWO.webp',
                height: width * 0.13,
              ),
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
                        }, isActive: 'CONTACT', ),
                    ],
                  ),
                );
              }
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Contact Us',
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                      style: TextStyle(
                          color: Colors.white,fontSize: width * 0.05,fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                      // maxFontSize:width * 0.1,
                      maxLines:1,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  EdtTxt(labletxt: 'Name', hintText: 'enter name', obscureText: false,),
                  EdtTxt(labletxt: 'Email', hintText: 'enter email', obscureText: false,),
                  EdtTxt(labletxt: 'Phone', hintText: 'enter phone number', obscureText: false,),
                  EdtTxt(labletxt: 'Company', hintText: 'enter compnany', obscureText: false,),
                  EdtTxtMessage(labletxt: 'Message', hintText: "enter message", obscureText: false),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: BtnServices(txt:'Submit', onPressed: (){})),
                  SizedBox(height: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<ContactUSController>(
                        init:ContactUSController(),
                        builder: (controller) {
                          return GestureDetector(
                           onTap: (){
                             controller.ShowMail();
                           },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: width* controller.mailwidh,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(45),
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kSecandrycolor,
                                    child: Icon(Icons.mail_outline,color: Colors.white,),
                                  ),
                                  controller.isshowemail?Flexible(
                                    child: GestureDetector(
                                      onTap: (){
                                        print('object');
                                        String? encodeQueryParameters(Map<String, String> params) {
                                          return params.entries
                                              .map((MapEntry<String, String> e) =>
                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                              .join('&');
                                        }
                                        final Uri emailLaunchURI = Uri(
                                          scheme: 'mailto',
                                          path: 'info@term.ae',
                                          query: encodeQueryParameters(<String, String>{
                                            'subject': 'Application',
                                          }),
                                        );
                                        launchUrl(emailLaunchURI);
                                      },
                                      onLongPress: (){
                                        print('long');
                                        controller.LongPress();

                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text('${controller.textToCopy}',
                                            textScaleFactor: ScaleSize.textScaleFactor(context),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: width*0.04,color: Colors.white),)),
                                    ),
                                  ):Container()
                                ],
                              ),
                            ),
                          );
                        }
                      ),
                      GetBuilder<ContactUSController>(
                          init:ContactUSController(),
                          builder: (controller){
                          return GestureDetector(
                            onTap: (){
                              controller.ShowLocatio();
                            },
                            child: AnimatedContainer(
                              width: width *controller.locatiowidh,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(45),
                              ),
                              duration: Duration(milliseconds: 300),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kSecandrycolor,
                                    child: Icon(Icons.location_on_outlined,color: Colors.white,),
                                  ),
                                 controller.isshowelocatio? Flexible(
                                    child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text('United Arab Emirates, Dubai',
                                          textScaleFactor: ScaleSize.textScaleFactor(context),
                                          style: TextStyle(fontSize: width*0.04,color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ):Container()

                                ],
                              ),
                            ),
                          );
                        }
                      ),
                      GetBuilder<ContactUSController>(
                          init:ContactUSController(),
                          builder: (controller){
                          return GestureDetector(
                            onTap: (){
                              controller.Showfacebook();
                            },
                            child: AnimatedContainer(
                              width: width *controller.facewidh,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(45),
                              ),
                              duration: Duration(milliseconds: 300),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kSecandrycolor,
                                    child: Icon(Icons.facebook,color: Colors.white,),
                                  ),
                                 controller.isshowefacebook? Flexible(
                                    child: InkWell(
                                      onTap: () async {
                                        // String url = 'https://www.facebook.com/term.infotech/';
                                        print('sssss');
                                        final Uri _url = Uri.parse('https://www.facebook.com/term.infotech/');
                                        if (!await launchUrl(_url)) {
                                        throw Exception('Could not launch $_url');
                                        }

                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text('term.infotech',
                                            textScaleFactor: ScaleSize.textScaleFactor(context),
                                            style: TextStyle(fontSize: width*0.04,color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ),
                                  ):Container()

                                ],
                              ),
                            ),
                          );
                        }
                      ),
                      GetBuilder<ContactUSController>(
                          init:ContactUSController(),
                          builder: (controller){
                          return GestureDetector(
                            onTap: (){
                              controller.ShowInsta();
                            },
                            child: AnimatedContainer(
                              width: width *controller.instawidh,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(45),
                              ),
                              duration: Duration(milliseconds: 300),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kSecandrycolor,
                                    child: SvgPicture.asset('assets/svg/instagram.svg',width: width*0.05,)
                                  ),
                                 controller.isshoweinsta? Flexible(
                                    child: InkWell(
                                      onTap: () async {
                                        final Uri _url = Uri.parse('https://www.instagram.com/term.infotech/');
                                        if (!await launchUrl(_url)) {
                                        throw Exception('Could not launch $_url');
                                        }
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text('term.infotech',
                                            textScaleFactor: ScaleSize.textScaleFactor(context),
                                            style: TextStyle(fontSize: width*0.04,color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ),
                                  ):Container()

                                ],
                              ),
                            ),
                          );
                        }
                      ),
                      GetBuilder<ContactUSController>(
                          init:ContactUSController(),
                          builder: (controller){
                          return GestureDetector(
                            onTap: (){
                              controller.ShowTik();
                            },
                            child: AnimatedContainer(
                              width: width *controller.tiktokwidh,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(45),
                              ),
                              duration: Duration(milliseconds: 300),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kSecandrycolor,
                                    child: Icon(Icons.tiktok,color: Colors.white,),
                                  ),
                                 controller.isshowetiktok? Flexible(
                                    child: InkWell(
                                      onTap: ()async {
                                        final Uri _url = Uri.parse('https://www.tiktok.com/@term.infotech');
                                        if (!await launchUrl(_url)) {
                                          throw Exception('Could not launch $_url');
                                        }
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text('@term.infotech',
                                            textScaleFactor: ScaleSize.textScaleFactor(context),
                                            style: TextStyle(fontSize: width*0.04,color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ),
                                  ):Container()

                                ],
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
