

import 'package:flutter/cupertino.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';



class PrimaryText extends StatelessWidget {
   final double size;
   final FontWeight fontWeight;
   final Color color;
   final String text;
   final double height;



   const PrimaryText({super.key,
   this.size = 20,
       this.fontWeight =FontWeight.w400,
       this.color =AppColors.primary,
      required this.text,
       this.height =1.3});

   @override
  Widget build(BuildContext context) {
    return  Text(text,
    style: TextStyle(
      color: color,
      height: height,
      fontSize: size,
      fontWeight: fontWeight
    ),);
  }
}
