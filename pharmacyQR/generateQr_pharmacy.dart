

import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy_managmentsystem/map/cubit.dart';
import 'package:pharmacy_managmentsystem/map/google_map_try.dart';
import 'package:pharmacy_managmentsystem/map/state.dart';
import 'package:pharmacy_managmentsystem/pharmacyQR/Pharmacy_qr.dart';
import 'package:pharmacy_managmentsystem/pharmacyQR/cubit.dart';
import 'package:pharmacy_managmentsystem/pharmacyQR/state.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQr_Pharmacy extends StatefulWidget{

  @override
  State<GenerateQr_Pharmacy> createState() {
    return _GenerateQr_Pharmacy();
  }
}

class _GenerateQr_Pharmacy extends State<GenerateQr_Pharmacy> {

@override
  void initState() {
  Pharmacy_QR_Cubit.get(context).getQRCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Pharmacy_QR_Cubit, Pharmacy_QR_CubitStates>(
      listener:(context,state) {


        if(state is generatePharmacy_QR_CubitSuccessState){

         Timer(Duration(seconds: 10 ), () => { navigateAndFinish(context: context, widget: GenerateQr_Pharmacy()),
           print("time to change qr")

         });


        }
        if(state is generatePharmacy_QR_CubitErrorState){
          showToast(text:"Unauthorized." ,state: ToastStates.EROOR);
        }

      },
      builder:(context,state)  {
      var qrcode = Pharmacy_QR_Cubit.get(context).Qrcode;


        return  Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            titleSpacing: 0.0,
            leadingWidth: 46,
            elevation: 0.0,
            flexibleSpace: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    HexColor('A8BEE7'),
                    HexColor('AEC9DE'), //gray light
                    //gray dark
                    HexColor('BBC5CE'),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),

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
              physics: const BouncingScrollPhysics(),

              child: Column(
               children:[
                 SizedBox(height: 20,),

                 Text("Pharmacy QR Code".tr,style: TextStyle(fontSize: 35,color:HexColor(green.toString()), ),)
                 ,

                 Padding(
                   padding: const EdgeInsets.all(40.0),
                   child:   ConditionalBuilder(
                   condition: state is !generatePharmacy_QR_CubitLoadingState ,
                   builder: (context) => QrImageView(
                       data: qrcode,
                       version: QrVersions.auto,
                       size: 200.0,
                       backgroundColor: Colors.white,
                     ),

                   fallback: (context) =>
                   const Center(child: CircularProgressIndicator()),
                 )
                 ),
               ]
              ),


            ),
          ),

        );

      },
    );



  }



}
