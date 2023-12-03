import 'package:flutter/material.dart';
import 'package:term/helper/colors/colors.dart';
import 'package:term/helper/contstant/scalesize.dart';
class ContainerServices extends StatelessWidget {
  const ContainerServices({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(

      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23.61)
      ),
      child: Center(
        child: Text(
          'Services',
          textScaleFactor: ScaleSize.textScaleFactor(context),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kSecandrycolor,fontSize:width* 0.05),
        ),
      ),

    );
  }
}
