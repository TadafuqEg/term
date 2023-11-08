import 'package:flutter/material.dart';
import 'package:term/helper/colors/colors.dart';
class ServiceDetaielsCont extends StatelessWidget {
  final String txt;
  const ServiceDetaielsCont({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kSecandrycolor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
        child:Text(txt,style:Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),),
      ),

    );
  }
}
