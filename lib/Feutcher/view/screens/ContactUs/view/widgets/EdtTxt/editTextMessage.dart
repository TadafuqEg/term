
import 'package:flutter/material.dart';

import '../../../../../../../helper/contstant/scalesize.dart';

class EdtTxtMessage extends StatelessWidget {
  final String labletxt;
  final String hintText;
  final bool obscureText;

  const EdtTxtMessage({super.key,required this.labletxt,required this.hintText,required this.obscureText});

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
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
                    color: Colors.white,
                    fontFamily: 'Sansation'
                ),

                obscureText: obscureText,
                maxLines: 8,
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
          )
        ],
      ),
    );
  }
}
