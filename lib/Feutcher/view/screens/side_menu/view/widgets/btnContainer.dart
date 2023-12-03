import 'package:flutter/material.dart';
import 'package:term/helper/colors/colors.dart';
import 'package:term/helper/contstant/scalesize.dart';
class BtnContainerSideMenu extends StatelessWidget {
  final bool isActive;
  final String title;
  final icon;
  final VoidCallback ?press;
  const BtnContainerSideMenu({super.key,required this.isActive,required this.title,this.icon,this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(top:20,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon,color: kSecandrycolor,size: 26,),
            Text('${title}',
              textScaleFactor: ScaleSize.textScaleFactor(context),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),),
            isActive?Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.circle,color: kSecandrycolor,size: 10,),
              ],
            ):Container(),

          ],
        ),
      ),
    );
  }
}
