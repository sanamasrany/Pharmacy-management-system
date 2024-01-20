import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy_managmentsystem/Home/home.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';

class PainRelief extends StatelessWidget {

   ImageProvider  image1 = AssetImage('images/saffron.jpg');
   ImageProvider    image2 = AssetImage('images/Fenugreek.jpg');
   ImageProvider   image3 = AssetImage('images/basil.jpg');



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:80,
        titleSpacing: 4,
        leadingWidth: 58,
        elevation: 0.0,
        flexibleSpace: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient:LinearGradient(
              begin:  Alignment.topRight,
              end:Alignment.bottomLeft ,
              colors: [
                HexColor('A8BEE7'),
                HexColor('AEC9DE'),
                HexColor('BBC5CE'),
 ],
              tileMode: TileMode.clamp,

            ),
          ) ,
        ),
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {
            navigateTo(widget:HomeScreen() ,context:context);
          }, icon:Icon(Icons.arrow_back,color: Colors.black87,)),
        )
        ,
        title:Row(
          children: [
            Text("Pain Relief",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.normal),),
          ],
        ) ,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
            child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image(image:AssetImage("images/chest-pain-or-pressure.png"))

                ]
            ),
          )
        ],

      ),
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
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                          image:image1,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                        ),
                      ),

                    ),
                    Text("Saffron",style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                        color:Colors.white),)
                  ],
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                          image: image2,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                        ),
                      ),

                    ),
                    Text("Fenugreek",style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                        color:Colors.white),)
                  ],
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                          image: image3,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                        ),
                      ),

                    ),
                    Text("Basil",style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                        color:Colors.white),)
                  ],
                ),

              ),

            ],
          ),
        ),
      ),


    );
  }
}
