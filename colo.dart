import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Ro extends StatelessWidget {
  const Ro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:LinearGradient(

              begin:  Alignment.topRight,
              end:Alignment.bottomLeft ,

              colors: [
                HexColor('A8BEE7'),
                HexColor('AEC9DE'),//gray light
               //gray dark
                HexColor('BBC5CE'),
                HexColor('BDB9C7'),//
                HexColor('D3C8CC'),
                HexColor('D3CACF'),
                HexColor('DBD9DE'),
                HexColor('D7D2D8'),

              ],
            tileMode: TileMode.clamp,

          ),

        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
              horizontal: 25, vertical: 120),

        ),
      ),
    );
  }
}
