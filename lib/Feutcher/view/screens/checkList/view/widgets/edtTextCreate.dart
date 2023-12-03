
import 'package:flutter/material.dart';

import '../../../../../../../helper/contstant/scalesize.dart';

class EdtTxtChecklist extends StatelessWidget {

  final String hintText;
  final TextEditingController ?tec;
  final VoidCallback? onEditingComplete;
  final onsupmiting;

  const EdtTxtChecklist({super.key,required this.hintText,this.tec, this.onEditingComplete,this.onsupmiting});

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);

    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
      color:Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    child: MediaQuery(
      data: mqData.copyWith(textScaleFactor:ScaleSize.textScaleFactor(context)),
      child: TextField(
        onEditingComplete: onEditingComplete,
        onSubmitted: onsupmiting,
        controller: tec,
        decoration:InputDecoration(
          hintText: "${hintText}",
          border: InputBorder.none,
          labelStyle:  TextStyle(
              color: Colors.white,
              fontFamily: 'Sansation'
          ),
          hintStyle:  TextStyle(
            color: Colors.orange.withOpacity(0.4),
              fontFamily: 'Sansation'
          )
        ) ,
      ),
    ),
    );
  }
}
