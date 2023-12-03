
import 'package:flutter/material.dart';

import '../../../../../../../helper/contstant/scalesize.dart';

class EdtTxt extends StatelessWidget {
  final String labletxt;
  final String hintText;
  final bool obscureText;
  final keyboardType;
  final  prefixIcon;
  final suffixIcon;
  const EdtTxt({super.key,required this.labletxt,required this.hintText,required this.obscureText,this.keyboardType,this.prefixIcon,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);

    return Container(
      margin: EdgeInsets.only(left:25,right: 25,top: 25 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$labletxt',style: TextStyle(
            fontFamily: 'Sansation',
            color: Colors.white
          ),
              textScaleFactor:ScaleSize.textScaleFactor(context)
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
            color:Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: MediaQuery(
            data: mqData.copyWith(textScaleFactor:ScaleSize.textScaleFactor(context)),
            child: TextField(
              style: TextStyle(
                  fontFamily: 'Sansation'
              ),
              keyboardType: keyboardType,
              obscureText: obscureText,
              decoration:InputDecoration(
                hintText: "${hintText}",
                prefixIcon: prefixIcon,
                //,
                suffixIcon: suffixIcon,
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
          )
        ],
      ),
    );
  }
}
