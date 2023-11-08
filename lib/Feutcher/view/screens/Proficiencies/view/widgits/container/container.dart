import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
class DateProficListWidget extends StatelessWidget {
  final String title ;
  final String Descpriton ;
  const DateProficListWidget({super.key, required this.title, required this.Descpriton});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultTextStyle(style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              repeatForever: false,
              animatedTexts: [
                TypewriterAnimatedText(title,
                  speed: const Duration(milliseconds: 30),
                ),
              ],


            ),),
          // Text(title, style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white),),
          Container(margin: EdgeInsets.only(left: 10,top: 10),
            child: DefaultTextStyle(style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                child: AnimatedTextKit(
              totalRepeatCount: 1,
              repeatForever: false,
              animatedTexts: [
                TypewriterAnimatedText(Descpriton,
                  speed: const Duration(milliseconds: 30),
                ),
              ],


            ),)
            // Text(Descpriton, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),),
          )
        ],
      ) ,
    );
  }
}
