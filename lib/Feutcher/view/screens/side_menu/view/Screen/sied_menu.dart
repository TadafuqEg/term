import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/side_menu/view/widgets/btnContainer.dart';
import 'package:term/helper/colors/colors.dart';
import 'package:term/helper/contstant/scalesize.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';
class SideMenuScreen extends StatelessWidget {
  final VoidCallback ?press;
  final Icon ? icon;
  final String isActive;
  const SideMenuScreen({super.key,this.press,this.icon,required this.isActive});

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
        width:width*0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kSecandrycolor.withOpacity(0.4)
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left:16,top: 10),
                  // width: double.infinity,
                  child: Image.asset(
                    'assets/images/logoWO.webp',
                    width: width * 0.2,
                  ),
                ),
                // IconButton(onPressed: press, icon: Icon(Icons.clear,color: Colors.white,size: 30,))
                IconButton(onPressed: press,icon: icon!,
                )

              ],
              ),
              // SizedBox(height: 90,),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: kbackGroundcolor
                ),
                child: Column(
                  children: [
                    BtnContainerSideMenu(isActive: isActive=='Home'?true:false,title:'HOME',icon: Icons.home_max_sharp,press: (){
                      Get.offNamed('/mainScreen');
                    },),
                    Divider(color: Colors.grey.withOpacity(0.5),),
                    BtnContainerSideMenu(isActive:isActive=='ABOUT'?true:false,title:'ABOUT US',icon: Icons.info_rounded,
                        press: (){
                          Get.offNamed('/about');
                        },
                    ),
                    Divider(color: Colors.grey.withOpacity(0.5),),
                    BtnContainerSideMenu(isActive:isActive=='SERVICES'?true:false,title:'SERVICES',icon: Icons.miscellaneous_services,
                        press: (){
                          Get.offNamed('/servicesScreen');
                        },
                    ),
                    Divider(color: Colors.grey.withOpacity(0.5),),
                    BtnContainerSideMenu(isActive:isActive=='PROFICIENCIES'?true:false,title:'PROFICIENCIES',icon: Icons.task_alt,
                        press: (){
                          Get.offNamed('/proficiencies');
                        },
                    ),
                    Divider(color: Colors.grey.withOpacity(0.5),),
                    BtnContainerSideMenu(isActive: isActive=='CONTACT'?true:false,title:'CONTACT US',icon: Icons.contacts,
                      press: (){
                        Get.offNamed('/contactus');
                      },
                    ),
                  ],
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () async {
                    print('ss');
                   try{
                     String? encodeQueryParameters(Map<String, String> params) {
                       return params.entries
                           .map((MapEntry<String, String> e) =>
                       '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                           .join('&');
                     }
                     print('Test');

                     const url = 'mailto:info@term.ae';
                     if (await launcher.canLaunchUrl(Uri.parse(url))) {
                       await launcher.launchUrl(Uri.parse(url));
                     } else {
                       throw 'Could not launch $url';
                     }
                     // Uri uri = Uri(
                     //   scheme: 'mailto',
                     //   path: 'info@term.ae',
                     // );
                     // if(await launcher.canLaunchUrl(uri)){
                     //   await launcher.launchUrl(uri);
                     // }else{
                     //   throw Exception('Could not launch$uri');
                     // }
                     // if(!await launcher.launchUrl(uri)){
                     //   print('Could not launch the uri');
                     // }
                     // final Uri emailLaunchURI =await Uri(
                     //   scheme: 'mailto',
                     //   path: 'info@term.ae',
                     //   query: encodeQueryParameters(<String, String>{
                     //     'subject': 'Application',
                     //   }),
                     // );
                     // await launchUrl(emailLaunchURI);

                   }catch(e){
                     print(e);
                   }
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: kbackGroundcolor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("LET'S TALK",
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),),
                      Icon(Icons.mail,color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Align(alignment: Alignment.bottomCenter,
              child: Text(
                textScaleFactor: ScaleSize.textScaleFactor(context),

                'Powered by\nTadafuq',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white,),
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
