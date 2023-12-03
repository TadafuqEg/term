import 'package:flutter/material.dart';
import 'package:term/helper/colors/colors.dart';

class BTNSupmit extends StatelessWidget {
  final String txt;
  final GestureTapCallback onPressed;
  const BTNSupmit({super.key,required this.txt,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ButtonStyle style =
    ElevatedButton.styleFrom(
        backgroundColor: kSecandrycolor,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 50),
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        textStyle: const TextStyle(fontSize: 18));
    return Container(
      margin: EdgeInsets.only(left: 35,right: 35,top: 1,bottom: 20),
      child: ElevatedButton(
        onPressed: onPressed, child: Text(txt),style: style,),
    );
  }
}
