import 'package:flutter/material.dart';
// gray light #B7BDCB
// #A4A5B7
// gay between #9C9DB1
// gray #9BA0BA
// green #3F968E
// white #E9DFE0
// #E0DEE1

// HexColor('A8BEE7'),
// HexColor('AEC9DE'),//gray light
// //gray dark
// HexColor('BBC5CE'),
// HexColor('BDB9C7'),//
// HexColor('D3C8CC'),
// HexColor('D3CACF'),
// HexColor('DBD9DE'),
// HexColor('D7D2D8'),

const Color firstBackColor = Color(0xFFA8BEE7) ;
const Color secondBackColor = Color(0xFFAEC9DE) ;
const Color thirdBackColor = Color(0xFFBBC5CE) ;
const Color fourthBackColor = Color(0xFFBDB9C7) ;
const Color fifthBackColor = Color(0xFFD3C8CC) ;
const Color sixBackColor = Color(0xFFD3CACF) ;
const Color seventhBackColor = Color(0xFFDBD9DE) ;
const Color eightBackColor = Color(0xFFD7D2D8) ;
const Color greentheem = Color(0xFF3F968E) ;

const BoxDecoration gradientBackground = BoxDecoration(

    gradient: LinearGradient(
         begin: Alignment.topLeft,
         end: Alignment.bottomRight,

        colors: [
          firstBackColor,
          secondBackColor,
          thirdBackColor,
          fourthBackColor,
          fifthBackColor,
          sixBackColor,
          seventhBackColor,
          eightBackColor,


        ]
    )

);