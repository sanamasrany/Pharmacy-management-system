

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy_managmentsystem/map/cubit.dart';
import 'package:pharmacy_managmentsystem/map/google_map_try.dart';
import 'package:pharmacy_managmentsystem/map/state.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';




class Pharmacy_Read_QRCode extends StatefulWidget {
  @override
  State<Pharmacy_Read_QRCode> createState() {
    return _Pharmacy_Read_QRCode();
  }
}

class _Pharmacy_Read_QRCode extends State<Pharmacy_Read_QRCode>{
final qrKey = GlobalKey(debugLabel: 'QR');
QRViewController? controller;
Barcode? barcode;

@override
void dispose(){
  controller?.dispose();
  super.dispose();
}

@override
void reassemble()async {
  super.reassemble();

  if(Platform.isAndroid){
    await controller!.pauseCamera();
  }
  controller!.resumeCamera();
}

  @override
  Widget build(BuildContext context) {

        return
          SafeArea(child: Scaffold(


            body: Stack(
             alignment: Alignment.center,

            children: [
              buildQrview(context),
              Positioned(bottom: 10,child: buildresult()),

            ],




              ),
            ),




          );




  }

  Widget buildQrview(BuildContext context) => QRView(key: qrKey,
      onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: MediaQuery.of(context).size.width*0.8,
      borderWidth: 10,
      borderLength: 20,
      borderRadius: 10,
      borderColor: HexColor(green.toString()),
    ),
  );

Widget buildresult()=>
    Container(
      padding: EdgeInsets.all(12),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white24
      ),
      child:   Text(
        barcode != null ?  barcode!.code.toString() : 'Scan a code!',
        maxLines: 3,
      )
    )
  ;

void onQRViewCreated(QRViewController controller){
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((val)=>
    setState(() {
      this.barcode = val;
      print("llll   ${barcode!.code}");
    })
    );
}


}
