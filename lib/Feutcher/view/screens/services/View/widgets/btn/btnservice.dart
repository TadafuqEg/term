import 'package:flutter/material.dart';
import 'package:term/helper/colors/colors.dart';
class BtnServices extends StatelessWidget {
  final String txt;
  final GestureTapCallback onPressed;
  const BtnServices({super.key,required this.txt,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ButtonStyle style =
    ElevatedButton.styleFrom(
        backgroundColor: kSecandrycolor,
        foregroundColor: Colors.white,
        minimumSize: Size(10, 50),
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
        // textStyle: const TextStyle(fontSize: 16)
    );
    return Container(
      margin: EdgeInsets.only(left: 10,bottom: 10),
      child: ElevatedButton(
        onPressed: onPressed, child: Center(child: Text(txt,
      textAlign: TextAlign.center,

        style:Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
      )),style: style,
      ),
    );
  }
}
