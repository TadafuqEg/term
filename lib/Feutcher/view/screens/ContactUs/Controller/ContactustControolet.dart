import 'package:flutter/services.dart';
import 'package:get/get.dart';
class ContactUSController extends GetxController{
  bool isshowemail=  false;
  bool isshowelocatio=  false;
  bool isshowefacebook=  false;
  bool isshoweinsta=  false;
  bool isshowetiktok=  false;
  double mailwidh= 0.2;
  double locatiowidh= 0.2;
  double facewidh= 0.2;
  double instawidh= 0.2;
  double tiktokwidh= 0.2;

  ShowMail(){
    isshowemail = true;
    mailwidh=0.6;
    update();
  }
  ShowLocatio(){
    isshowelocatio = true;
    locatiowidh = 0.82;
    update();
  }
  Showfacebook(){
    isshowefacebook = true;
    facewidh = 0.6;
    update();
  } ShowInsta(){
    isshoweinsta = true;
    instawidh = 0.6;
    update();
  }
  ShowTik(){
    isshowetiktok = true;
    tiktokwidh = 0.6;
    update();
  }

  final String textToCopy = 'info@term.ae';
  LongPress(){
    Clipboard.setData(ClipboardData(text: textToCopy));
  }


}