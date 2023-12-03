import 'package:flutter/material.dart';
import 'package:term/helper/colors/colors.dart';
import 'package:term/helper/contstant/scalesize.dart';
class BtnServices extends StatelessWidget {
  final String txt;
  final GestureTapCallback onPressed;
  const BtnServices({super.key,required this.txt,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    ButtonStyle style =
    ElevatedButton.styleFrom(
        backgroundColor: kSecandrycolor,
        foregroundColor: Colors.white,
        minimumSize: Size(10, 50),
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
        // textStyle: TextStyle(fontSize:width* 0.05 )
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white,width: 2)
      ),
      margin: EdgeInsets.only(left: 10,bottom: 10),
      child: ElevatedButton(
        onPressed: onPressed, child: Center(child: Text(txt,
      textAlign: TextAlign.center,
        textScaleFactor: ScaleSize.textScaleFactor(context),
        style:Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white,fontSize:width* 0.05),
      )),style: style,
      ),
    );
  }
}
