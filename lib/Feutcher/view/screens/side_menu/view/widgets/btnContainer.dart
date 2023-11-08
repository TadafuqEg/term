import 'package:flutter/material.dart';
import 'package:term/helper/colors/colors.dart';
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
        margin: EdgeInsets.only(top:20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon,color: kSecandrycolor,),
            Text('${title}',style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),),
            isActive?Icon(Icons.circle,color: Colors.white,size: 10,):Container()
          ],
        ),
      ),
    );
  }
}
