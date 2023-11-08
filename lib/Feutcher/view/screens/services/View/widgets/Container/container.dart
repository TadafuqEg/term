import 'package:flutter/material.dart';
import 'package:term/helper/colors/colors.dart';
class ContainerServices extends StatelessWidget {
  const ContainerServices({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 189.46,
     
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23.61)
      ),
      child: Center(
        child: Text(
          'Services',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kSecandrycolor),
        ),
      ),

    );
  }
}
