import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:term/helper/contstant/scalesize.dart';

class MyDialog extends StatelessWidget {
  final onpressed;
  const MyDialog({super.key,this.onpressed});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Dialog(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SvgPicture.asset('assets/svg/d3.svg',width: width*0.8,),
          Positioned(
              top: -70,
              child: Image.asset('assets/images/d5.webp',width: width * 0.2,)),
          Positioned(
            top:35,
            child: Text("Are you Sure to send Data",
            style: TextStyle(color: Colors.white,fontSize: 18),
                textScaleFactor:
                ScaleSize.textScaleFactor(
                    context)
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    // Close the dialog
                    Get.back();
                  },
                  child: Text('Close',
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900)
                      ,textScaleFactor:
                  ScaleSize.textScaleFactor(
                      context)),
                ),
                TextButton(
                  onPressed: onpressed,
                  child: Text('Send',
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900)
                      ,textScaleFactor:
                  ScaleSize.textScaleFactor(
                      context)),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
/*
AlertDialog(
      title: Text('Dialog Title'),
      content: Text('This is the content of the dialog.'),
      actions: [
        TextButton(
          onPressed: () {
            // Close the dialog
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
        TextButton(
          onPressed: () {
            // Add your custom action here
            Navigator.of(context).pop();
          },
          child: Text('Custom Action'),
        ),
      ],
    );
 */