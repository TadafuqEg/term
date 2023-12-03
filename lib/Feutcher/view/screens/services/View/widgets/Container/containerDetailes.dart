import 'package:flutter/material.dart';
import 'package:term/helper/colors/colors.dart';
import 'package:term/helper/contstant/scalesize.dart';
class ServiceDetaielsCont extends StatelessWidget {
  final String txt;
  const ServiceDetaielsCont({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kSecandrycolor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
        child:Text(txt,
          textScaleFactor: ScaleSize.textScaleFactor(context),
          style:Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white,fontSize:width* 0.05),textAlign: TextAlign.center,),
      ),

    );
  }
}
